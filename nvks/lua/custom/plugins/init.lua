-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Better Window Navigation
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
  fileencoding = "utf-8",
  number = true,
  swapfile = false,
  backspace = "indent,start,eol",
  ignorecase = true,
  smartcase = true,
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

return {
  'kchmck/vim-coffee-script',
  'doums/darcula',
  'folke/tokyonight.nvim',
  {
    'sjl/badwolf',
    priority = 1000,
    config = function ()
    	vim.cmd.colorscheme 'badwolf'
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
