---@type NvPluginSpec[]
local plugins = {
	-- for plugin management, update with `:MasonUpdate`, install with `:MasonInstall`
	-- or `MasonInstallAll`, check status with `:Mason` and `:checkhealth mason`
	{
		"williamboman/mason.nvim",
		opts = function()
			local utils = require("core-utils")
			local default_opts = require("nvchad.configs.mason")
			local custom_opts = require("configs.mason")
			return utils.merge_tb("force", default_opts, custom_opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"j-hui/fidget.nvim",
		opts = function()
			return require("configs.fidget")
		end,
	},
	-- for better highlighting, update with `:TSUpdate`, install with `:TSInstall`
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return require("configs.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"abecodes/tabout.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		-- opts = function()
		-- 	return require("configs.treesitter-textobjects")
		-- end,
		config = function()
			local opts = require("configs.treesitter-textobjects")
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("configs.treesitter-context")
		end,
	},
	{
		"abecodes/tabout.nvim",
		event = "InsertEnter",
		config = function()
			require("configs.tabout")
		end,
	},
	--   Old text                    Command         New text
	--------------------------------------------------------------------------------
	--  surr*ound_words             ysiw)           (surround_words)
	--    *make strings               ys$"            "make strings"
	--    [delete ar*ound me!]        ds]             delete around me!
	--    remove <b>HTML t*ags</b>    dst             remove HTML tags
	--    'change quot*es'            cs'"            "change quotes"
	--    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
	--    delete(functi*on calls)     dsf             function calls
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"fedepujol/move.nvim",
		event = "VeryLazy",
		opts = {
			line = {
				enable = true, -- Enables line movement
				indent = true, -- Toggles indentation
			},
			block = {
				enable = true, -- Enables block movement
				indent = true, -- Toggles indentation
			},
			word = {
				enable = true, -- Enables word movement
			},
			char = {
				enable = true, -- Enables char movement
			},
		},
	},
	-- for better file explorer
	-- nvimtree, use NvChad configure
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	opts = function()
	-- 		return require("configs.nvimtree")
	-- 	end,
	-- },

	-- formatters
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- for debugging.
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("configs.dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			-- dap.listeners.before.event_terminated.dapui_config = function()
			--   dapui.close()
			-- end
			-- dap.listeners.before.event_exited.dapui_config = function()
			--   dapui.close()
			-- end
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = false,
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local M = require("nvchad.configs.cmp")
			table.insert(M.sources, { name = "crates" })
			return M
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = true, auto_trigger = true },
			panel = { enabled = true, auto_refresh = true },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
		-- config = function()
		-- 	vim.defer_fn(function()
		-- 		require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
		-- 		require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
		-- 	end, 100)
		-- end,
	},
	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
