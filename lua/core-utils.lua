local M = {}

M.merge_tb = vim.tbl_deep_extend

M.echo = function(str)
	vim.cmd("redraw")
	vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.shell_call = function(args)
	local output = vim.fn.system(args)
	assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

M.load_mappings = function(section)
	vim.schedule(function()
		local function set_section_map(section_values)
			for mode, mode_values in pairs(section_values) do
				for keybind, mapping_info in pairs(mode_values) do
					local opts = {}
					opts.desc = mapping_info[2]
					vim.keymap.set(mode, keybind, mapping_info[1], opts)
				end
			end
		end
		set_section_map(section)
	end)
end

M.lazy_load = function(plugin)
	vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
		group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
		callback = function()
			local file = vim.fn.expand("%")
			local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

			if condition then
				vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

				-- dont defer for treesitter as it will show slow highlighting
				-- This deferring only happens only when we do "nvim filename"
				if plugin ~= "nvim-treesitter" then
					vim.schedule(function()
						require("lazy").load({ plugins = plugin })

						if plugin == "nvim-lspconfig" then
							vim.cmd("silent! do FileType")
						end
					end)
				else
					require("lazy").load({ plugins = plugin })
				end
			end
		end,
	})
end

local function _list_table(tb, table_list, level)
	local ret = ""
	local indent = string.rep(" ", level * 4)

	for k, v in pairs(tb) do
		local quo = type(k) == "string" and '"' or ""
		ret = ret .. indent .. "[" .. quo .. tostring(k) .. quo .. "] = "

		if type(v) == "table" then
			local t_name = table_list[v]
			if t_name then
				ret = ret .. tostring(v) .. ' -- > ["' .. t_name .. '"]\n'
			else
				table_list[v] = tostring(k)
				ret = ret .. "{\n"
				ret = ret .. _list_table(v, table_list, level + 1)
				ret = ret .. indent .. "}\n"
			end
		elseif type(v) == "string" then
			ret = ret .. '"' .. tostring(v) .. '"\n'
		else
			ret = ret .. tostring(v) .. "\n"
		end
	end

	local mt = getmetatable(tb)
	if mt then
		ret = ret .. "\n"
		local t_name = table_list[mt]
		ret = ret .. indent .. "<metatable> = "

		if t_name then
			ret = ret .. tostring(mt) .. ' -- > ["' .. t_name .. '"]\n'
		else
			ret = ret .. "{\n"
			ret = ret .. _list_table(mt, table_list, level + 1)
			ret = ret .. indent .. "}\n"
		end
	end

	return ret
end

M.table_tostring = function(tb)
	if type(tb) ~= "table" then
		error("Sorry, it's not table, it is " .. type(tb) .. ".")
	end

	local ret = " = {\n"
	local table_list = {}
	table_list[tb] = "root table"
	ret = ret .. _list_table(tb, table_list, 1)
	ret = ret .. "}"
	return ret
end

M.table_print = function(tb)
	print(tostring(tb) .. M.table_tostring(tb))
end

return M
