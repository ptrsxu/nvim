return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup({
        sources = {
          -- check <https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md>
          -- for more choices.
          -- make sure they can be manged by mason.
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.erb_lint,
          -- null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.rustywind,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.diagnostics.pylint,
        },
      })

      -- local on_attach = function(client, bufnr)
      --   if client.supports_method("textDocument/formatting") then
      --     vim.api.nvim_clear_autocmds({
      --       group = augroup,
      --       buffer = bufnr,
      --     })
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       group = augroup,
      --       buffer = bufnr,
      --       callback = function()
      --         vim.lsp.buf.format({ bufnr = bufnr })
      --       end,
      --     })
      --   end
      -- end
    end,
    keys = {
      {
        "<leader>gf",
        function()
          vim.lsp.buf.format({ timeout_ms = 2000 })
        end,
        mode = { "n", "x", "o" },
        desc = "Format with None LS",
      },
    },
  },
}
