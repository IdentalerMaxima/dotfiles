-- Set line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.hlsearch = false

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true

-- Terminal
if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.o.shell = "powershell"
else
  vim.o.shell = "/bin/bash"
end

