if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

call plug#begin('$HOME/.vim/plugged')
" Color
Plug 'sjl/badwolf'
Plug 'doums/darcula'
"Plug 'altercation/vim-colors-solarized'
"Plug 'nelstrom/vim-blackboard'
"Plug 'josephwecker/murphytango.vim'
"Plug 'imarbuger/vim-vividchalk'
"Plug 'ciaranm/inkpot'
"Plug 'ayu-theme/ayu-vim'
" NerdTree
Plug 'scrooloose/nerdtree'
" Lang
Plug 'kchmck/vim-coffee-script'
Plug 'jelera/vim-javascript-syntax'
Plug 'rust-lang/rust.vim'
" pyflakes
Plug 'mitechie/pyflakes-pathogen'
" git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
" Tagbar
Plug 'majutsushi/tagbar'
" for indent
Plug 'nathanaelkane/vim-indent-guides'
" airline
Plug 'vim-airline/vim-airline'
" sudo.vim
Plug 'vim-scripts/sudo.vim'
Plug 'vim-scripts/vim-auto-save'
" for comment out
Plug 'tyru/caw.vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

Plug 'plasticboy/vim-markdown'
Plug 'digitaltoad/vim-jade'
call plug#end()

filetype plugin indent on
syntax enable

" map Leader to space key
let mapleader = "\<Space>"

" NERDTree
nmap <Leader>\ :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

scriptencoding utf-8
set encoding=utf-8
"if has('windows')
"  set encoding=cp932
"endif
"if !has('gui_running')
"  set t_Co=256
"endif

" vimrc
nnoremap <Leader>. :<C-u>edit $HOME/.vimrc<Enter>
nnoremap <Leader>s. :<C-u>source $HOME/.vimrc<Enter>

set number
set noswapfile
set backspace=indent,start,eol
set ignorecase
set smartcase
set hlsearch
set showcmd
set pastetoggle=<F4>

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set nosmartindent
set cindent

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%


" tagbar
nmap <Leader>t :TagbarToggle<CR>

" caw comment out keymapping
nmap <Leader>/ <plug>(caw:i:toggle)
vmap <Leader>/ <plug>(caw:i:toggle)
nmap <C-\> <plug>(caw:i:toggle)
vmap <C-\> <plug>(caw:i:toggle)
" disable auto-commentout :help fo-table
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" for vim-indent-guides
let g:indent_guides_auto_color = 0
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" for vim-auto-save
let g:auto_save = 1

" for markdown
let g:vim_markdown_folding_disabled=1

" for previm
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"Airline
"set laststatus=2
"set showtabline=2 " 常にタブラインを表示
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Ctrl + 矢印でウィンドウサイズを変更
nnoremap <C-Left>  <C-w><<CR>
nnoremap <C-Right> <C-w>><CR>
nnoremap <C-Up>    <C-w>-<CR>
nnoremap <C-Down>  <C-w>+<CR>

"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

colorscheme badwolf
"colorscheme darcula
"colorscheme blue
"colorscheme elflord
"colorscheme peachpuff
"colorscheme solarized
"set background=dark

" msys2
if executable('/msys2.exe')
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif

" /var/log/messages
autocmd BufNewFile,BufReadPost /var/log/messages*,/var/log/secure*,/var/log/    *.log :set filetype=messages
