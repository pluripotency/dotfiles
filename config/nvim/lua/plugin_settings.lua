-- Airline
vim.opt.laststatus = 2
-- 常にタブラインを表示'
vim.opt.showtabline = 2
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
vim.g['airline_powerline_fonts'] = 1

-- vim-indent-guides
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_color = 0
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1
vim.cmd 'autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=237'
vim.cmd 'autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=236'

