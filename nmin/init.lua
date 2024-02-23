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
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

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
  'tpope/vim-surround',
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
  'vim-scripts/vim-auto-save',
    config = function ()
      -- auto save
      vim.g.auto_save = 1
    end,
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
local options = {
  encoding = "utf-8",
  -- fileencoding = "utf-8",
-- Make line numbers default
  number = true,
  swapfile = false,
  backspace = "indent,start,eol",
-- Case-insensitive searching UNLESS \C or capital in search
  ignorecase = true,
  smartcase = true,
-- Set highlight on search
  hlsearch = true,
  showcmd = true,
  pastetoggle = "<F4>",
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  smarttab = true,
  expandtab = true,
  autoindent = true,
  smartindent = false,
  cindent = true,
  list = true,
  listchars = 'tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%',
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

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

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

