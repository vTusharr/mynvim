local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

return {
  on_attach = function(client, bufnr)
    -- Call NvChad's default on_attach first
    on_attach(client, bufnr)
    
    -- Optional: Python-specific keymaps
    local opts = { buffer = bufnr }
    
    -- Format with ruff (pyrefly handles this)
    vim.keymap.set("n", "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    
    -- Format on save for Python
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
  capabilities = capabilities,
  -- Optional: Custom settings if needed
  settings = {
    pyrefly = {
      enable = true,
    }
  }
}