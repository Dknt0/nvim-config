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
-- Pick up the project venv automatically: walk up from root_dir looking for
-- .venv/bin/python; fall back to `python3` on $PATH. A per-project
-- pyrightconfig.json (if present) still supplies extraPaths, report flags, etc.
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  before_init = function(_, config)
    local path = config.root_dir
    local venv_python = nil
    while path and path ~= "/" do
      local candidate = path .. "/.venv/bin/python"
      if vim.fn.executable(candidate) == 1 then
        venv_python = candidate
        break
      end
      path = vim.fn.fnamemodify(path, ":h")
    end
    config.settings = {
      python = {
        pythonPath = venv_python or vim.fn.exepath "python3",
      },
    }
  end,
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
