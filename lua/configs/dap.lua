local mappings = {
	n = {
		["<leader>dt"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Toggle Breakpoint",
		},
		["<leader>dc"] = {
			"<cmd> DapContinue <CR>",
			"Dap Continue",
		},
		["<leader>di"] = {
			"<cmd> DapStepInto <CR>",
			"DapStepInto",
		},
		["<leader>do"] = {
			"<cmd> DapStepOut <CR>",
			"DapStepOut",
		},
		["<leader>dn"] = {
			"<cmd> DapStepOver <CR>",
			"DapStepOver",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Debug Run ...",
		},
		["<leader>ds"] = {
			function()
				require("dapui").toggle()
			end,
			"Open Debugging Sidebar",
		},
	},
}

require("core-utils").load_mappings(mappings)
