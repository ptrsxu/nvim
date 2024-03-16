local M = {}

M.ui = {
	theme = "catppuccin",

	cmp = {
		icons = true,
		lspkind_text = true,
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
		selected_item_bg = "colored", -- colored / simple
	},

	telescope = { style = "bordered" }, -- borderless / bordered

	------------------------------- nvchad_ui modules -----------------------------
	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
		overriden_modules = nil,
	},

	-- lazyload it when there are 1+ buffers
	tabufline = {
		show_numbers = true,
		enabled = true,
		lazyload = true,
		overriden_modules = nil,
	},

	nvdash = {
		load_on_startup = true,

		-- header = {
		--   "           ▄ ▄                   ",
		--   "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
		--   "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
		--   "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
		--   "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
		--   "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
		--   "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
		--   "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
		--   "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
		-- },
		header = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		},

		buttons = {
			{ "  Find File", "Spc f f", "Telescope find_files" },
			{ "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
			{ "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
			{ "  Bookmarks", "Spc m a", "Telescope marks" },
			{ "  Themes", "Spc t h", "Telescope themes" },
			{ "  Mappings", "Spc c h", "NvCheatsheet" },
		},
	},

	cheatsheet = { theme = "grid" }, -- simple/grid

	lsp = {
		-- show function signatures i.e args as you type
		signature = {
			disabled = false,
			silent = true, -- silences 'no signature help available' message from appearing
		},
	},
}

return M
