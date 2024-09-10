set encoding=utf-8
scriptencoding utf-8

if has('windows')
"  set encoding=cp932

" gvim Scrollbar
"set guioptions=Ace
set guioptions-=L

" gvim メニュー文字化け
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

endif

set guifont=PlemolJP\ Console\ NF:h12
set guifontwide=PlemolJP\ Console\ NF:h12

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
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%


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

" vim-plug(https://github.com/junegunn/vim-plug)
" use powershell to install
" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
"    ni $HOME/vimfiles/autoload/plug.vim -Force
call plug#begin()
" Color
Plug 'sjl/badwolf'
Plug 'doums/darcula'
"Plug 'altercation/vim-colors-solarized'
Plug 'nelstrom/vim-blackboard'
Plug 'josephwecker/murphytango.vim'
"Plug 'imarbuger/vim-vividchalk'
Plug 'ciaranm/inkpot'
Plug 'ayu-theme/ayu-vim'
" NerdTree
Plug 'scrooloose/nerdtree'
" Lang
Plug 'kchmck/vim-coffee-script'
Plug 'jelera/vim-javascript-syntax'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'digitaltoad/vim-pug'
Plug 'chrisbra/csv.vim'
" pyflakes
Plug 'mitechie/pyflakes-pathogen'
" git
Plug 'tpope/vim-fugitive'
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

nnoremap <Leader>. :<C-u>edit $HOME/.vimrc<Enter>
nnoremap <Leader>s. :<C-u>source $HOME/.vimrc<Enter>

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
if has('t_Co==256')
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_guide_size= 1
  let g:indent_guides_start_level = 2
"  let g:indent_guides_auto_color = 0
"  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
"  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
endif

" for vim-auto-save
let g:auto_save = 1
" for markdown
let g:vim_markdown_folding_disabled=1
"Airline
"set laststatus=2
"set showtabline=2 " 常にタブラインを表示
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1

"colorscheme badwolf
colorscheme darcula
"colorscheme blue
"colorscheme elflord
"colorscheme peachpuff
"colorscheme solarized
"set background=dark

" /var/log/messages
autocmd BufNewFile,BufReadPost /var/log/messages*,/var/log/secure*,/var/log/    *.log :set filetype=messages

