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
	    "nvim-lua/plenary.nvim",
	      module = "plenary"
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
    config = function ()
      -- TODO
    end
  }
}
