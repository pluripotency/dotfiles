if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

call plug#begin('$HOME/.local/share/nvim/plugged')
" Color
Plug 'altercation/vim-colors-solarized'
Plug '29decibel/codeschool-vim-theme'
Plug 'sjl/badwolf'
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
" lightline
Plug 'itchyny/lightline.vim'
" sudo.vim
Plug 'vim-scripts/sudo.vim'
Plug 'vim-scripts/vim-auto-save'
" for comment out
Plug 'tyru/caw.vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
" rust
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'plasticboy/vim-markdown'
Plug 'digitaltoad/vim-jade'
call plug#end()

if executable('rls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whiitelist': ['rust'],
        \ })
endif

filetype plugin indent on
syntax enable

" map Leader to space key
let mapleader = "\<Space>"

nmap <Leader>\ :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"  \ 'colorscheme': 'PaperColor',
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ }

set statusline=%m%r%h%w\ %{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[%Y]%t\ %{fugitive#statusline()}\ %1l/%L,%c\ %P
set laststatus=2

scriptencoding utf-8
set encoding=utf-8
"if has('windows')
"  set encoding=cp932
"endif

if !has('gui_running')
  set t_Co=256
endif

nnoremap <Space>. :<C-u>edit $HOME/.vimrc<Enter>
nnoremap <Space>s. :<C-u>source $HOME/.vimrc<Enter>
nmap <Leader>t :TagbarToggle<CR>

" caw
" For comment out
nmap <Leader>/ <plug>(caw:i:toggle)
vmap <Leader>/ <plug>(caw:i:toggle)
nmap <C-\> <plug>(caw:i:toggle)
vmap <C-\> <plug>(caw:i:toggle)

autocmd BufNewFile,BufReadPost /var/log/messages*,/var/log/secure*,/var/log/    *.log :set filetype=messages


set number
set noswapfile
"set gfn=Ricty\ Discord\ for\ PowerLine\ Regular\ 12
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

" for jedi
" command! -nargs=0 JediRename :call jedi#rename()
" let g:jedi#rename_command = ""
" let g:jedi#pytdoc ="k"

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

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

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

"colorscheme blue
"colorscheme codeschool
colorscheme badwolf
"colorscheme solarized
"set background=dark
