return {
	{
		"smoka7/hop.nvim",
		opts = {
			multi_windows = true,
			keys = "htnsueoaidgcrlypmbkjvx",
			uppercase_labels = false,
		},
		keys = {
			{
				"<leader>j",
				function()
					require("hop").hint_words()
				end,
				mode = { "n", "x", "o" },
        desc = "Jump in File"
			},
		},
	},
}
