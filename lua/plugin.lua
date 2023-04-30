local fn = vim.fn
local install_dir = fn.stdpath('data') .. '/site/pack/packer'
local install_path = install_dir .. '/opt/packer.nvim'
if fn.empty(fn.glob(install_dir)) > 0 then
    print("installing: " .. install_path)
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    download_result = fn.system({'ls', '-l', install_path})
    print("download_result: " .. download_result)
end

vim.cmd [[packadd packer.nvim]] -- packadd packer module

--vim.cmd.packadd "packer.nvim"
require("packer").startup(function()
  use 'wbthomason/packer.nvim'
  -- Coc
  use({'neoclide/coc.nvim', branch = 'release'})
  -- Terminal
  use 'thinca/vim-quickrun'
  -- Color
  use 'altercation/vim-colors-solarized'
  use '29decibel/codeschool-vim-theme'
  use 'sjl/badwolf'
  use 'EdenEast/nightfox.nvim'
  --use 'nelstrom/vim-blackboard'
  --use 'josephwecker/murphytango.vim'
  --use 'imarbuger/vim-vividchalk'
  --use 'ciaranm/inkpot'
  --use 'dracula/vim'
  --use 'ayu-theme/ayu-vim'
  -- NerdTree
  --use 'scrooloose/nerdtree'
  use 'preservim/nerdtree'
  -- Lang
  use 'kchmck/vim-coffee-script'
  use 'jelera/vim-javascript-syntax'
  use 'rust-lang/rust.vim'
  -- pyflakes
  use 'mitechie/pyflakes-pathogen'
  -- git
  use 'tpope/vim-fugitive'
  use 'gregsexton/gitv'
  -- Tagbar
  use 'majutsushi/tagbar'
  -- for indent
  use 'nathanaelkane/vim-indent-guides'
  -- lightline
  --use 'itchyny/lightline.vim'
  use 'vim-airline/vim-airline'
  -- sudo.vim
  use 'vim-scripts/sudo.vim'
  use 'vim-scripts/vim-auto-save'
  -- for comment out
  use 'tyru/caw.vim'
  use 'tpope/vim-surround'
  use 'terryma/vim-multiple-cursors'
  use 'prabirshrestha/async.vim'
  use 'prabirshrestha/vim-lsp'
  use 'prabirshrestha/asyncomplete.vim'
  use 'prabirshrestha/asyncomplete-lsp.vim'

  use 'plasticboy/vim-markdown'
  use 'digitaltoad/vim-jade'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
