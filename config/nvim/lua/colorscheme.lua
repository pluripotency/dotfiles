local status_ok, packer = pcall(require, "darcula")
if not status_ok then
--  vim.cmd 'colorscheme elflord'
  vim.cmd 'colorscheme darkblue'
--  vim.cmd 'colorscheme peachpuff'
  return
else
vim.cmd 'colorscheme darcula'
--vim.cmd 'colorscheme badwolf'
--vim.cmd 'colorscheme tokyonight'
--vim.cmd 'colorscheme solarized'
--vim.cmd 'set background=dark'
end

