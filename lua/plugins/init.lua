return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
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
    config = function() end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
    },
    config = function()

      require('configs.copilot')
    end,
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
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function()
      vim.g.mkdp_auto_start = 0 -- Don't auto-start
      vim.g.mkdp_auto_close = 1 -- Auto close when changing buffers
      vim.g.mkdp_refresh_slow = 0 -- Refresh on save or leaving insert mode
      vim.g.mkdp_browser = "google-chrome" -- Use default browser
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {},
      }
      vim.g.mkdp_theme = "dark"
    end,
    ft = { "markdown" },
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
    },
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.neoscroll"
    end,
  },
}
