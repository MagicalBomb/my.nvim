-- 光标行
vim.opt.cursorline = true

-- 启用鼠标
vim.opt.mouse:append("a")

-- 缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- 系统剪贴板
---- 连接系统剪贴板和 nvim 自带的剪贴板
vim.opt.clipboard:append("unnamedplus")

