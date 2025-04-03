local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = require("custom.configs.nvim-treesitter-context"),
    -- lazy = false,
    keys = {
      "<c-e>",
      "<c-y>",
    },
  },

  {
    "hiphish/rainbow-delimiters.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    lazy = false,
    enabled = true,
  },

  {
    "andymass/vim-matchup",
    keys = {
      "%",
    },
    event = "VeryLazy",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.cmd('let g:loaded_matchit             = 1')
      vim.cmd('let g:matchup_matchparen_enabled = 1')
    end,
    lazy = false,
    enabled = true,
  },

  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'UndotreeToggle' })
    end,
    -- keys = {
    --   "<leader>u",
    -- },
    lazy = false,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {},
    lazy = true,
  },

  {
    "vim-test/vim-test",
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    event = "VeryLazy",
    config = function()
      vim.fn["mkdp#util#install"]()
      vim.g.mkdp_auto_start = 1
    end,
  },

  {
    "xiyaowong/telescope-emoji.nvim",
    lazy=false,
    config = function()
      require("telescope").load_extension("emoji")
      vim.keymap.set('n', '<leader>pe', ":Telescope emoji<CR>", { desc = 'pick emoji' })
    end,
  },
  {
    "junegunn/vim-easy-align",
    lazy=false,
    config = function()
      -- vim.keymap.set('n', ',a', "<Plug>(EasyAlign)", { desc = 'easy align' })
      vim.keymap.set('v', ',a', "<Plug>(EasyAlign)", { desc = 'easy align' })
    end,
  },
  { -- code outline
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    config = function()
      -- code outline window for skimming and quick navigation
      require("custom.configs.aerial")
    end
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }


}

-- {  -- override telescope
require("custom.configs.telescope")
-- }

return plugins
