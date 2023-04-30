-- Airline
vim.opt.laststatus = 2
-- 常にタブラインを表示'
vim.opt.showtabline = 2
vim.cmd 'let g:airline#extensions#tabline#enabled = 1'
vim.cmd 'let g:airline#extensions#tabline#buffer_idx_mode = 1'
vim.cmd 'let g:airline_powerline_fonts = 1'

-- vim-indent-guides
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_color = 0
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1
vim.cmd 'autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3'
vim.cmd 'autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4'

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- caw for comment out
keymap("n", "<Leader>/", "<plug>(caw:i:toggle)", {})
keymap("v", "<Leader>/", "<plug>(caw:i:toggle)", {})
keymap("n", "<C-\\>", "<plug>(caw:i:toggle)", {})
keymap("v", "<C-\\>", "<plug>(caw:i:toggle)", {})

-- nerdtree
keymap("n", "<leader>n", ":NERDTreeToggle<CR>", {noremap = true})

