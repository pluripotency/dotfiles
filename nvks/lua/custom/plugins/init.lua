-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  'navarasu/onedark.nvim',
  'kchmck/vim-coffee-script',
  'doums/darcula',
  'folke/tokyonight.nvim',
  {
    'sjl/badwolf',
    priority = 1000,
    config = function ()
    	vim.cmd.colorscheme 'darcula'
    end,
  },
  'vim-scripts/sudo.vim',
  -- 'tpope/vim-surround',
   -- auto bracket completion
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  {
    'tyru/caw.vim',
    config = function ()
      -- caw for comment out <C-_> means <C-/>
      vim.keymap.set("n", "<C-_>",     "<plug>(caw:i:toggle)", { desc = '' })
      vim.keymap.set("v", "<C-_>",     "<plug>(caw:i:toggle)", { desc = '' })
      vim.keymap.set("n", "<Leader>/", "<plug>(caw:i:toggle)", { desc = '' })
      vim.keymap.set("v", "<Leader>/", "<plug>(caw:i:toggle)", { desc = '' })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  -- {
  -- 'vim-scripts/vim-auto-save',
  --   config = function ()
  --     -- auto save
  --     vim.g.auto_save = 1
  --   end,
  -- },
  -- {
  --   'pocco81/auto-save.nvim',
  -- },
  -- {
  --   'okuuva/auto-save.nvim',
  --   cmd = "ASToggle", -- optional for lazy loading on command
  --   event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  --   opts = {
  --     -- your config goes here
  --     -- or just leave it empty :)
  --   },
  --   -- triger_events= {
  --   --   immediae_save = { "BufLeave", "FocusLost" },
  --   --   defer_save = { "InsertLeave" },
  --   --   cancel_defered_save ={"InsertEnter"},
  --   -- },
  --   -- debounce_delay = 1000,
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    },
    config = function ()
      require('nvim-tree').setup {
        update_focused_file = {
          enable = true,
          update_cwd = true,
        }
      }
      vim.keymap.set('n', '<leader>n', ":NvimTreeToggle<CR>", { desc = '[N]vimTreeToggle' })
      -- vim.o.autochdir = true
    end,
  }
  --{
  --  "nvim-neo-tree/neo-tree.nvim",
  --  version = "*",
  --  dependencies = {
  --    "nvim-lua/plenary.nvim",
  --    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --    "MunifTanjim/nui.nvim",
  --  },
  --  config = function ()
  --    require('neo-tree').setup {}
  --    vim.keymap.set('n', '<leader>n', ":Neotree toggle<CR>", { desc = '[N]eotree toggle' })
  --  end,
  --}
}

