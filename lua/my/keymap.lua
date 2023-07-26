vim.g.mapleader = " "

-- nvim-tree
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")

-- bufferline
vim.keymap.set("n", "J", ":bprevious<CR>")
vim.keymap.set("n", "K", ":bnext<CR>")
vim.keymap.set("n", "<Leader>w", ":BufferLineCloseOthers<CR>")

-- telescope
