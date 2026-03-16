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
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   version = "^19.0.0",
  --   event = "VeryLazy",
  --   opts = {
  --     adapters = {
  --       claude_code = function()
  --         return require("codecompanion.adapters").extend("claude_code", {
  --           schema = {
  --           },
  --         })
  --       end,
  --       http = {
  --         anthropic = function()
  --           return require("codecompanion.adapters").extend("anthropic", {
  --             -- url = "https://chat.cloudapi.vip/v1/messages",
  --             url = "https://open.bigmodel.cn/api/paas/v4/messages",
  --             env = {
  --               api_key = "ANTHROPIC_API_KEY",
  --             },
  --             schema = {
  --               model = {
  --                 -- default = "claude-opus-4-5-20251101-code",
  --                 default = "gpt-5.3-codex-medium",
  --               },
  --             },
  --           })
  --         end,
  --         openai = function()
  --           return require("codecompanion.adapters").extend("openai", {
  --             -- url = "https://chat.cloudapi.vip/v1/chat/completions",
  --             url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
  --             env = {
  --               api_key = "Z_AI_API_KEY",
  --             },
  --             schema = {
  --               model = {
  --                 -- default = "claude-opus-4-6-code",
  --                 default = "glm-4.7",
  --               },
  --             },
  --           })
  --         end,
  --       },
  --     },
  --     interactions = {
  --       chat = {
  --         -- adapter = "openai",
  --         adapter = "claude_code",
  --       },
  --       inline = {
  --         -- adapter = "openai",
  --         adapter = "claude_code",
  --       },
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },
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
