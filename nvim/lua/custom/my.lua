-- My Setting Options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the upper window' })
-- Change Window Size
-- vim.keymap.set('n', '<C-Left>', '<C-w>><CR>', { desc = 'Change Window Size to Left' })
-- vim.keymap.set('n', '<C-Down>', '<C-w>-<CR>', { desc = 'Change Window Size to Down' })
-- vim.keymap.set('n', '<C-Up>', '<C-w>+<CR>', { desc = 'Change Window Size to Up' })
-- vim.keymap.set('n', '<C-Right>', '<C-w><<CR>', { desc = 'Change Window Size to Right' })
-- Split Window
-- vim.keymap.set('n', 'ss', ':split<Return><C-w>w', { desc = 'Split Window Horizontal' })
-- vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { desc = 'Split Window Vertical' })
-- Terminal
vim.keymap.set('n', '<C-t>', ':split<CR><C-w>j:resize 20<CR>:term<CR>', { desc = 'Open Terminal with 20size' })
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { desc = 'Exit Terminal Mode' })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Move focus to the right window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Move focus to the upper window' })

-- vim.g.python3_host_prog = '/home/worker/.virtualenv/v3/bin/python'
-- vim.g.python_host_prog = '/home/worker/.virtualenv/v3/bin/python'

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('turn_off_auto_commenting', {}),
  pattern = '*',
  command = [[setlocal fo-=cro]],
})
vim.o.encoding = 'utf-8'
vim.o.swapfile = false
vim.o.backspace = 'indent,start,eol'
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
-- End My Setting Options

vim.g.python_recommended_style = 1
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.indentexpr = ""
  end,
})
