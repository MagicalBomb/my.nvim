-- 行号
vim.opt.relativenumber = true
vim.opt.number = true

-- 防止窗口宽度不足时换行显示
vim.opt.wrap = false

-- nvim 颜色显示更丰富
vim.opt.termguicolors = true
-- 左侧多出一列符号列，用于显示更丰富的信息
-- 如：断点符号，GIT 版本控制信息
vim.opt.signcolumn = "yes"

-- Themes
vim.cmd[[colorscheme tokyonight-night]]
-- vim.cmd[[colorscheme tokyonight-storm]]
-- vim.cmd[[colorscheme tokyonight-moon]]
-- vim.cmd[[colorscheme tokyonight-day]]
