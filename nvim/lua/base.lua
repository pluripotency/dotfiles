vim.g.auto_save = 1
vim.g.python3_host_prog = '/home/worker/.virtualenv/v3/bin/python'
vim.g.python_host_prog = '/home/worker/.virtualenv/v3/bin/python'

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
  cindent = true,
  list = true,
  listchars = 'tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%',
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('turn_off_auto_commenting', {}),
  pattern = '*',
  command = [[setlocal fo-=cro]]
})
