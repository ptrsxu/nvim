vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require("options")
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

vim.schedule(function()
  require("mappings")
end)

vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- add some configs for neovide
if vim.g.neovide then
  -- allow Meta
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
  -- Allow clipboard copy paste in neovim
  vim.g.neovide_input_use_logo = 1
  -- Enable Command + and Command - to resize fonts
  vim.keymap.set("n", "<D-=>", function ()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end, { noremap = true, silent = true })
  vim.keymap.set("n", "<D-->", function ()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
  end, { noremap = true, silent = true })
  vim.keymap.set("n", "<D-0>", function ()
    vim.g.neovide_scale_factor = 1
  end, { noremap = true, silent = true })
end
