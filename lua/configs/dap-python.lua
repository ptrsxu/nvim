local mappings = {
	n = {
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
			"Debug Running Python Test",
		},
	},
}

return mappings
