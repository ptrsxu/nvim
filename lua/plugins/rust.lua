return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		ft = { "rust" },
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			local on_attach = require("nvchad.configs.lspconfig").on_attach
			local capabilities = require("nvchad.configs.lspconfig").capabilities
			vim.g.rustaceanvim = {
				server = {
					on_attach = on_attach,
					capabilities = capabilities,
				},
			}
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
		keys = {
			{
				"<leader>roc",
				function()
					require("crates").open_crates_io()
				end,
				mode = { "n", "x", "o" },
				desc = "Open Crates.IO",
			},
			{
				"<leader>rod",
				function()
					require("crates").open_documentation()
				end,
				mode = { "n", "x", "o" },
				desc = "Open Crate Documentation",
			},
			{
				"<leader>ruc",
				function()
					require("crates").upgrade_crate()
				end,
				mode = { "n", "x", "o" },
				desc = "Update Crates",
			},
			{
				"<leader>rua",
				function()
					require("crates").upgrade_all_crates()
				end,
				mode = { "n", "x", "o" },
				desc = "Update Crates",
			},
		},
	},
}
