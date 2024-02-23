
-- My Setting Options

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

vim.o.encoding = "utf-8"
-- vim.o.fileencoding = "utf-8"
vim.o.number = true
vim.o.swapfile = false
vim.o.backspace = "indent,start,eol"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.showcmd = true
vim.o.pastetoggle = "<F4>"
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = false
vim.o.cindent = true
vim.o.list = true
vim.o.listchars = 'tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%'

-- End My Setting Options
