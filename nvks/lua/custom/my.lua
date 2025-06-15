-- My Setting Options
-- Better Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the upper window' })
-- Change Window Size
vim.keymap.set('n', '<C-Left>', '<C-w>><CR>', { desc = 'Change Window Size to Left' })
vim.keymap.set('n', '<C-Down>', '<C-w>-<CR>', { desc = 'Change Window Size to Down' })
vim.keymap.set('n', '<C-Up>', '<C-w>+<CR>', { desc = 'Change Window Size to Up' })
vim.keymap.set('n', '<C-Right>', '<C-w><<CR>', { desc = 'Change Window Size to Right' })
-- Split Window
vim.keymap.set('n', 'ss', ':split<Return><C-w>w', { desc = 'Split Window Horizontal' })
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { desc = 'Split Window Vertical' })
-- Terminal
vim.keymap.set('n', '<C-t>', ':split<CR><C-w>j:resize 20<CR>:term<CR>', { desc = 'Open Terminal with 20size' })
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { desc = 'Exit Terminal Mode' })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Move focus to the right window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Move focus to the upper window' })
-- Comment Toggle
vim.keymap.set('n', '<C-//>', 'gcc', { desc = 'Comment Toggle' })
vim.keymap.set('v', '<C-//>', 'gc', { desc = 'Comment Toggle' })

-- vim.g.python3_host_prog = '/home/worker/.virtualenv/v3/bin/python'
-- vim.g.python_host_prog = '/home/worker/.virtualenv/v3/bin/python'

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('turn_off_auto_commenting', {}),
  pattern = '*',
  command = [[setlocal fo-=cro]],
})
vim.o.encoding = 'utf-8'
vim.o.number = true
vim.o.swapfile = false
vim.o.backspace = 'indent,start,eol'
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

vim.diagnostic.config { virtual_text = true }
