local lspconfig = require("lspconfig")

local servers = {
  "lua_ls",
  "pyright",
  "gopls",
  "rust_analyzer",
  "nil_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({})
end

-- diagnostics UI
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  float = { border = "rounded" },
})
