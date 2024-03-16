local options = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"astro",
		"bash",
		"cmake",
		"cuda",
		"go",
		"gomod",
		"gosum",
		"gowork",
		"proto",
		"thrift",
		"rust",
		"python",
		"sql",
		"yaml",
		"xml",
		"toml",
		"json",
		"dockerfile",
		"gitignore",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
	},
	-- autotag = {
	-- 	enable = true,
	-- },
}

return options
