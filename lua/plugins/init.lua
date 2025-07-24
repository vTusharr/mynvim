return {
  {
    "stevearc/conform.nvim",
     event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  
  -- These are some examples, uncomment them if you want to see them work!
  {
  "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- C/C++
        "clangd",
        "clang-format",

        -- Python
        "pyrefly",
        "ruff",         -- Linter, Formatter, and Language Server for Python

        -- Assembly
        "asmfmt",       -- Formatter for Assembly
        "asm-lsp",

        -- Web
        "html-lsp",
        "css-lsp",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
   { import = "nvchad.blink.lazyspec" },

  {
      "nvim-treesitter/nvim-treesitter",
      opts = {
          ensure_installed = {
              "vim", "lua", "vimdoc",
        "html", "css", "python", "c", "cpp", "bash", "asm"
          },
      },
  },
}
