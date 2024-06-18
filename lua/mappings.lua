require("nvchad.mappings")

-- add yours here
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })

vim.keymap.set("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

vim.keymap.set("i", "jk", "<ESC>", { desc = "Escape insert mode" })

------------------------------------------------------------
-- for `fedepujol/move.nvim` support fast move
------------------------------------------------------------
local move_opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", move_opts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", move_opts)
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", move_opts)
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", move_opts)
vim.keymap.set("n", "<leader>mf", ":MoveWord(1)<CR>", move_opts)
vim.keymap.set("n", "<leader>mb", ":MoveWord(-1)<CR>", move_opts)
-- Visual-mode commands
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", move_opts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", move_opts)
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", move_opts)
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", move_opts)

------------------------------------------------------------
-- for overriding `fedepujol/move.nvim`
------------------------------------------------------------
vim.keymap.set("n", "<space>rs", vim.lsp.buf.rename, { desc = "Refactore: Rename Symbol" })
vim.keymap.set("n", "<space>ts", function()
	if vim.lsp.inlay_hint then
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end
end, { desc = "Toggle Inlay Hints" })

vim.keymap.set("n", "<space>rr", ":Rest run<CR>", { desc = "Rest Run Request" })
vim.keymap.set("n", "<space>rl", ":Rest run last<CR>", { desc = "Rest Run Last Request" })
vim.keymap.set("n", "<space>re", ":lua require("telescope").extensions.rest.select_env()<CR>", { desc = "Rest Run Load Env File" })
