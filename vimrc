" install dir
let s:dein_dir = expand('~/local/dein')
" dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" install dein
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" load toml
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/dotfiles/dein/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " read toml
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" install if not installed
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

nmap <Leader>^ :NERDTreeToggle<CR>
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

"set statusline=%m%r%h%w\ %{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[%Y]%t\ %{fugitive#statusline()}\ %1l/%L,%c\ %P
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
set gfn=Ricty\ Discord\ for\ PowerLine\ Regular\ 12
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

colorscheme blue
"colorscheme codeschool
"colorscheme badwolf
"colorscheme solarized
"set background=dark

