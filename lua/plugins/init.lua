return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "rust-analyzer",
        "rustfmt",
      },
    },
  },
  {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "cpp",
        "cmake",
        "rust",
        "python",
        "yaml",
        "json",
        "markdown",
        "markdown_inline",
      },
    },
  },
  {
    "kkoomen/vim-doge",
    build = ":call doge#install()", -- Run the install command
    lazy = false, -- Load immediately (not lazy-loaded)
    config = function()
      vim.g.doge_enable_mappings = 0 -- Disable default mappings (recommended)
      vim.g.doge_doc_standard = "doxygen_cpp" -- For C++
      vim.g.doge_comment_interactive = 1 -- Enable interactive mode
      vim.g.doge_comment_jump_modes = "r" -- Jump to placeholder after generation
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.keymap.set("i", "`<Tab>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    event = "VeryLazy",
    opts = {
      adapters = {
        http = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              -- url = "https://chat.cloudapi.vip/v1/messages",
              url = "https://open.bigmodel.cn/api/paas/v4/messages",
              env = {
                api_key = "ANTHROPIC_API_KEY",
              },
              schema = {
                model = {
                  -- default = "claude-opus-4-5-20251101-code",
                  default = "gpt-5.3-codex-medium",
                },
              },
            })
          end,
          openai = function()
            return require("codecompanion.adapters").extend("openai", {
              -- url = "https://chat.cloudapi.vip/v1/chat/completions",
              url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
              env = {
                api_key = "Z_AI_API_KEY",
              },
              schema = {
                model = {
                  -- default = "claude-opus-4-6-code",
                  default = "glm-4.7",
                },
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = "openai",
        },
        inline = {
          adapter = "openai",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    depedencies = {
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    depedencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
  },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd app && npm install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   config = function()
  --     vim.g.mkdp_auto_start = 0 -- Don't auto-start
  --     vim.g.mkdp_auto_close = 1 -- Auto close when changing buffers
  --     vim.g.mkdp_refresh_slow = 0 -- Refresh on save or leaving insert mode
  --     vim.g.mkdp_browser = "google-chrome" -- Use default browser
  --     vim.g.mkdp_preview_options = {
  --       mkit = {},
  --       katex = {},
  --       uml = {},
  --       maid = {},
  --       disable_sync_scroll = 0,
  --       sync_scroll_type = "middle",
  --       hide_yaml_meta = 1,
  --       sequence_diagrams = {},
  --       flowchart_diagrams = {},
  --       content_editable = false,
  --       disable_filename = 0,
  --       toc = {},
  --     }
  --     vim.g.mkdp_theme = "dark"
  --   end,
  --   ft = { "markdown" },
  -- },
  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      scroll_buffer_space = true,
      legacy_computing_symbols_support = false,
      smear_insert_mode = true,
      cursor_color = "#cfb7ef",
    },
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.neoscroll"
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      disable_mouse = false,
      restricted_keys = {
        -- ["j"] = {},
        -- ["k"] = {},
        -- ["h"] = {},
        -- ["l"] = {},
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
