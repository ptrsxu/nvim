local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
configs.defaults()

-- if you just want default config for the servers then put them in a table
-- make sure these can be manged with mason
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "ruff_lsp", "gopls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
