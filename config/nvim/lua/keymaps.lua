local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
--vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Split Window
keymap("n", "ss",  ":split<Return><C-w>w", opts)
keymap("n", "sv",  ":vsplit<Return><C-w>w", opts)
-- Change Window Size
keymap("n", "<S-Left>",  "<C-w><<CR>", opts)
keymap("n", "<S-Right>", "<C-w>><CR>", opts)
keymap("n", "<S-Up>",    "<C-w>-<CR>", opts)
keymap("n", "<S-Down>",  "<C-w>+<CR>", opts)
-- Edit Config
keymap("n", "<Leader>.",  ":<C-u>edit $HOME/dotfiles/lua<Enter>", opts)
keymap("n", "<Leader>s.", ":<C-u>source $HOME/.config/nvim/init.lua<Enter>", opts)
-- Tagbar (require ctags)
keymap("n", "<Leader>t",  ":TagbarToggle<CR>", {})

-- caw for comment out <C-_> means <C-/>
keymap("n", "<C-_>",     "<plug>(caw:i:toggle)", opts)
keymap("v", "<C-_>",     "<plug>(caw:i:toggle)", opts)
keymap("n", "<Leader>/", "<plug>(caw:i:toggle)", opts)
keymap("v", "<Leader>/", "<plug>(caw:i:toggle)", opts)

-- nerdtree
keymap("n", "<leader>n", ":NERDTreeToggle<CR>", {noremap = true})
vim.g.NERDTreeDirArrow = 1
