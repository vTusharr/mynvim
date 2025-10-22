require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local mason_lspconfig = require "mason-lspconfig"

-- A list of servers to setup with lspconfig
local servers = { 
  "pyre",        -- Python LSP Server (pyrefly in Mason, pyre in lspconfig)
  "ruff",        -- Python linter/formatter LSP
  "clangd",      -- C/C++ language server
  "asm_lsp",     -- Assembly language server
  "lua_ls",      -- Lua language server
}

-- This ensures the servers are installed and mason-lspconfig is aware of them.
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true, -- Automatically install missing servers
}

-- Server-specific configurations
local server_configs = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  },
  clangd = {
    cmd = { 
      "clangd", 
      "--query-driver=C:/Users/Asus/scoop/apps/gcc/current/bin/g++.exe",
      "--background-index", 
      "--clang-tidy", 
      "--header-insertion=iwyu" 
    },
  },
}

-- Loop through the servers and set them up with lspconfig
for _, server_name in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  
  -- Merge server-specific config if it exists
  if server_configs[server_name] then
    config = vim.tbl_deep_extend("force", config, server_configs[server_name])
  end
  
  lspconfig[server_name].setup(config)
end
