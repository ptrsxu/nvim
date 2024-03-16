local options = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",
		"eslint_d",
    "erb_lint",
    "stylelint",
    "rustywind",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- shell stuff
		"shfmt",
		"shellcheck",

		-- rust stuff
		"rust-analyzer",
		"codelldb",
		"rustfmt",

		-- python stuff
		"pyright",
		"black",
		"debugpy",
		"mypy",
		"ruff-lsp",
    "isort",
		"pylint",

		-- go stuff
		"gopls",
		"goimports",
		"gofumpt",
		"dlv",
	},

	PATH = "skip",

	ui = {
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},

	max_concurrent_installers = 10,
}

return options
