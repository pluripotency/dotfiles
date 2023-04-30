vim.g.auto_save = 1

local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  number = true,
  swapfile = false,
  backspace = "indent,start,eol",
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  showcmd = true,
  pastetoggle = "<F4>",
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  smarttab = true,
  expandtab = true,
  autoindent = true,
  smartindent = false,
  cindent = true
}
for k, v in pairs(options) do
  vim.opt[k] = v
end
