local status_ok, packer = pcall(vim.cmd, "colorschem darcula")
if not status_ok then
--  vim.cmd 'colorscheme elflord'
  vim.cmd 'colorscheme darkblue'
--  vim.cmd 'colorscheme peachpuff'
  return
end
vim.cmd 'colorscheme darcula'
--vim.cmd 'colorscheme badwolf'
--vim.cmd 'colorscheme tokyonight'
--vim.cmd 'colorscheme solarized'
--vim.cmd 'set background=dark'

