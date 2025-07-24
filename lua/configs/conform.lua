local options = {
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    asm = { "asmfmt" },
  },
}

return options
