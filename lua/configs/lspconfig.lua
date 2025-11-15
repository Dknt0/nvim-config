-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end

local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

-- clangd config
vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--query-driver=/usr/bin/g++", -- Point clangd to g++
    "--background-index", -- Enable background indexing
    "--clang-tidy", -- Enable clang-tidy
    "--header-insertion=never", -- Disable automatic header insertion
    "--completion-style=detailed", --completion-style=detailed""
  },
})
vim.lsp.enable "clangd"

-- pyright config
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      pythonPath = vim.fn.exepath "python3",
    },
  },
})
vim.lsp.enable "pyright"

vim.lsp.config("cmake", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})
vim.lsp.enable "cmake"

-- rust-analyzer config
vim.lsp.config("rust_analyzer", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,
      cargo = {
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
vim.lsp.enable "rust_analyzer"

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
