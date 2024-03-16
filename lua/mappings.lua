require("nvchad.mappings")

-- add yours here
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })

vim.keymap.set("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

vim.keymap.set("i", "jk", "<ESC>", { desc = "Escape insert mode" })
