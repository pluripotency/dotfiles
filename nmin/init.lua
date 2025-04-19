vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/nvmin/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  print('Setting Up Lazy.nvim')
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'kchmck/vim-coffee-script',
  'digitaltoad/vim-pug',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function ()
    	vim.cmd.colorscheme 'onedark'
    end,
  },
  { 'folke/which-key.nvim',          opts = {} },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  'vim-scripts/sudo.vim',
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
  -- {
  -- 'vim-scripts/vim-auto-save',
  --   config = function ()
  --     -- auto save
  --     vim.g.auto_save = 1
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
      require('nvim-tree').setup {}
      vim.keymap.set('n', '<leader>n', ":NvimTreeToggle<CR>", { desc = '[N]vimTreeToggle' })
    end,
  },
}, {})

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = '' })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = '' })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = '' })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = '' })
-- Change Window Size
vim.keymap.set("n", "<C-Left>",  "<C-w>><CR>", { desc = '' })
vim.keymap.set("n", "<C-Down>",  "<C-w>-<CR>", { desc = '' })
vim.keymap.set("n", "<C-Up>",    "<C-w>+<CR>", { desc = '' })
vim.keymap.set("n", "<C-Right>", "<C-w><<CR>", { desc = '' })
-- Split Window
vim.keymap.set("n", "ss",  ":split<Return><C-w>w", { desc = '' })
vim.keymap.set("n", "sv",  ":vsplit<Return><C-w>w", { desc = '' })
-- Terminal
vim.keymap.set("n", "<C-t>",  ":split<CR><C-w>j:resize 20<CR>:term<CR>", { desc = '' })
vim.keymap.set("t", "<ESC>",  "<C-\\><C-n>", { desc = '' })

vim.g.python3_host_prog = '/home/worker/.virtualenv/v3/bin/python'
vim.g.python_host_prog = '/home/worker/.virtualenv/v3/bin/python'

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('turn_off_auto_commenting', {}),
  pattern = '*',
  command = [[setlocal fo-=cro]]
})
vim.o.encoding = "utf-8"
vim.wo.number = true
vim.o.swapfile = false
vim.o.backspace = "indent,start,eol"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.showcmd = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = false
vim.o.cindent = true
vim.o.list = true
-- vim.o.listchars = 'tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%'
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

