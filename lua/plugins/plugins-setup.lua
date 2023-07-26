local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 用于实现功能：保存此文件自动更新安装本文件中指定的插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- 外观 
    -- -- 主题
    use 'folke/tokyonight.nvim'
    -- -- 底部状态栏
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }


    -- 窗口
    use {
        'nvim-tree/nvim-tree.lua',  -- 文件浏览器 
        requires = {'nvim-tree/nvim-web-devicons', }
    }
    use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口


    -- 语言
    -- -- 语法高亮
    use "nvim-treesitter/nvim-treesitter"
    use { 
        "p00f/nvim-ts-rainbow", 
        requires = {"nvim-treesitter/nvim-treesitter"} 
    } -- 配合treesitter，不同括号颜色区分
    -- -- LSP
    use {
        "williamboman/mason.nvim", -- NVIM Lua 插件管理器
        "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
        "neovim/nvim-lspconfig"
    }
    -- -- 自动补全
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"
    use "hrsh7th/cmp-path" -- 文件路径


    use "numToStr/Comment.nvim" -- gcc和gc注释
    use "akinsho/bufferline.nvim" -- buffer分割线
    use "lewis6991/gitsigns.nvim" -- 左则git提示

    -- 文件检索跳转
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
