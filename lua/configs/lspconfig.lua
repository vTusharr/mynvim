require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local mason_lspconfig = require "mason-lspconfig"

-- A list of servers to setup with lspconfig
local servers = { "html", "cssls", "pyre", "clangd", "asm_lsp", "ruff" }

-- This ensures the servers are installed and mason-lspconfig is aware of them.
mason_lspconfig.setup {
  ensure_installed = servers,
}

-- Loop through the servers and set them up with lspconfig
for _, server_name in ipairs(servers) do
  -- Special handling for clangd to use your Scoop-installed GCC
  if server_name == "clangd" then
    lspconfig.clangd.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--query-driver=C:/Users/Asus/scoop/apps/gcc/current/bin/g++.exe",
      },
    }
  else
    -- Default setup for all other servers
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
