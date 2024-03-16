return {
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
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
				"<leader>ruc",
				function()
					require("crates").upgrade_all_crates()
				end,
				mode = { "n", "x", "o" },
				desc = "Update Crates",
			},
		},
	},
}
