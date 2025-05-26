-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

-- clangd config
lspconfig.clangd.setup {
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
}

-- pyright config
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      pythonPath = vim.fn.exepath "python3",
    },
  },
}

lspconfig.cmake.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- rust-analyzer config
lspconfig.rust_analyzer.setup {
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
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
