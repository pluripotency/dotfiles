local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("v", "<C-h>", "<C-w>h", opts)
keymap("v", "<C-j>", "<C-w>j", opts)
keymap("v", "<C-k>", "<C-w>k", opts)
keymap("v", "<C-l>", "<C-w>l", opts)
keymap("n", "<S-Left>",  "<C-w><<CR>", opts)
keymap("n", "<S-Right>", "<C-w>><CR>", opts)
keymap("n", "<S-Up>",    "<C-w>-<CR>", opts)
keymap("n", "<S-Down>",  "<C-w>+<CR>", opts)
keymap("n", "<leader>.",  "i<C-", opts)

keymap("n", "<Leader>.",  ":<C-u>edit $HOME/.config/nvim/nvimrc<Enter>", opts)
keymap("n", "<Leader>s.", ":<C-u>source $HOME/.config/nvim/nvimrc<Enter>", opts)
keymap("n", "<Leader>t",  ":TagbarToggle<CR>", {})

