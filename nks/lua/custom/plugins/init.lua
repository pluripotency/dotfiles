-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'kchmck/vim-coffee-script',
  'digitaltoad/vim-pug',

  'navarasu/onedark.nvim',
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
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  -- {
    -- 'tyru/caw.vim',
    -- config = function ()
    --   -- caw for comment out <C-_> means <C-/>
    --   vim.keymap.set("n", "<C-_>",     "<plug>(caw:i:toggle)", { desc = '' })
    --   vim.keymap.set("v", "<C-_>",     "<plug>(caw:i:toggle)", { desc = '' })
    --   vim.keymap.set("n", "<Leader>/", "<plug>(caw:i:toggle)", { desc = '' })
    --   vim.keymap.set("v", "<Leader>/", "<plug>(caw:i:toggle)", { desc = '' })
    -- end,
  -- },
  "nvimtools/none-ls.nvim",
  'jayp0521/mason-null-ls.nvim',
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   ft = "go",
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  {
    'okuuva/auto-save.nvim',
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      triger_events= {
        immediae_save = { "BufLeave", "FocusLost" },
        defer_save = { "InsertLeave" },
        cancel_defered_save ={"InsertEnter"},
      },
      debounce_delay = 1000,
      -- your config goes here
      -- or just leave it empty :)
    },
  },
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
}

