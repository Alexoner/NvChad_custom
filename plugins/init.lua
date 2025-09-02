-- see: https://nvchad.com/docs/config/plugins

local plugins = {
  -- { "folke/which-key.nvim",  enabled = false }, -- disable a default nvchad plugin
  
  -- this opts will extend the default opts 
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = {"python", "javascript", "java", "go", "rust", "cpp", "html", "css", "bash"} },
  },

  -- If your opts uses a function call ex: require*, then make opts spec a function
  -- Then modify the opts arg
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, conf)
      require("configs.telescope")
      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      }

     -- or 
     -- table.insert(conf.defaults.mappings.i, your table)
      return conf
    end,
  },

  -- Install new plugins
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
    opts = require("configs.nvim-treesitter-context"),
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
      require("configs.aerial")
    end
  },
  {
    'rcarriga/nvim-notify',
    config = function()
    end,
  }

}


return plugins
