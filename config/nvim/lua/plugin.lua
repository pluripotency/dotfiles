local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    print("installing: " .. install_path)
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    download_result = fn.system({'ls', '-l', install_path})
    print("download_result: " .. download_result)
    print("Close and reopen Neovim")
    vim.cmd [[packadd packer.nvim]] -- packadd packer module
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

require("packer").startup(function()
  use 'wbthomason/packer.nvim'
  -- LSP
--  use 'neovim/nvim-lspconfig'
--  use 'williamboman/mason.nvim'
--  use 'williamboman/mason-lspconfig.nvim'
--  -- Cmp
--  use "hrsh7th/nvim-cmp"
--  use "hrsh7th/cmp-nvim-lsp"
--  use "hrsh7th/vim-vsnip"
  -- Coc
--  use({'neoclide/coc.nvim', branch = 'release'})
  -- Terminal
  use 'thinca/vim-quickrun'
  -- Color
  use 'doums/darcula'
  use 'altercation/vim-colors-solarized'
  use 'sjl/badwolf'
  use 'folke/tokyonight.nvim'
  --use '29decibel/codeschool-vim-theme'
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

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
