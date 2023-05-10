-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/worker/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/worker/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/worker/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/worker/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/worker/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["async.vim"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/async.vim",
    url = "https://github.com/prabirshrestha/async.vim"
  },
  ["asyncomplete-lsp.vim"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/asyncomplete-lsp.vim",
    url = "https://github.com/prabirshrestha/asyncomplete-lsp.vim"
  },
  ["asyncomplete.vim"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/asyncomplete.vim",
    url = "https://github.com/prabirshrestha/asyncomplete.vim"
  },
  badwolf = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/badwolf",
    url = "https://github.com/sjl/badwolf"
  },
  ["caw.vim"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/caw.vim",
    url = "https://github.com/tyru/caw.vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["codeschool-vim-theme"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/codeschool-vim-theme",
    url = "https://github.com/29decibel/codeschool-vim-theme"
  },
  darcula = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/darcula",
    url = "https://github.com/doums/darcula"
  },
  gitv = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/gitv",
    url = "https://github.com/gregsexton/gitv"
  },
  nerdtree = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pyflakes-pathogen"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/pyflakes-pathogen",
    url = "https://github.com/mitechie/pyflakes-pathogen"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["sudo.vim"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/sudo.vim",
    url = "https://github.com/vim-scripts/sudo.vim"
  },
  tagbar = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-auto-save"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-auto-save",
    url = "https://github.com/vim-scripts/vim-auto-save"
  },
  ["vim-coffee-script"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-coffee-script",
    url = "https://github.com/kchmck/vim-coffee-script"
  },
  ["vim-colors-solarized"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-colors-solarized",
    url = "https://github.com/altercation/vim-colors-solarized"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-indent-guides"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-indent-guides",
    url = "https://github.com/nathanaelkane/vim-indent-guides"
  },
  ["vim-jade"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-jade",
    url = "https://github.com/digitaltoad/vim-jade"
  },
  ["vim-javascript-syntax"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-javascript-syntax",
    url = "https://github.com/jelera/vim-javascript-syntax"
  },
  ["vim-lsp"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-lsp",
    url = "https://github.com/prabirshrestha/vim-lsp"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors",
    url = "https://github.com/terryma/vim-multiple-cursors"
  },
  ["vim-quickrun"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-quickrun",
    url = "https://github.com/thinca/vim-quickrun"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/worker/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
