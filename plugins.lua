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
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      refactor = {
        highlight_definitions = {
          enable = true,
          -- Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = true,
        },
      },
    },
    lazy = false,
    enabled = false,
  },

  {
    "andymass/vim-matchup",
    -- keys = {
    --   "%",
    -- },
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.cmd('let g:loaded_matchit             = 1')
      vim.cmd('let g:matchup_matchparen_enabled = 1')
    end,
    lazy = false,
    enabled = false, -- TODO: matchup doesn't work yet.
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

-- {  -- telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

vim.keymap.set('n', '<C-p>', '<cmd>Telescope<cr>', {})
vim.keymap.set('n', '<F4>', builtin.git_files, {})
-- }


return plugins
