-- General options
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "" -- macOS-supported clipboard
vim.opt.timeoutlen = 300 -- Reduce delay for leader keymaps
vim.opt.background = "dark"

--some lsp
vim.lsp.enable("sqls")
