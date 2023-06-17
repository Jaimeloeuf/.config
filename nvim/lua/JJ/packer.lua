local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        print('Boot strapping Packer now...')
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- HOW TO INSTALL NEW PLUGINS:
-- 1. Find the plugin that you want to install on github and copy the repo path
-- 2. Copy the installation / setup code from github README, if none, use the
--    format, `use 'REPO PATH HERE'`
-- 3. Save the current file
-- 4. Source the file with :so
-- 5. Run :PackerSync to download the plugin and install it locally
-- 6. Restart nvim if needed by the plugin, else you can start using it already.
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Common utilities
    use 'nvim-lua/plenary.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- This is used for :TSPlaygroundToggle to see the AST of current file
    -- use ('nvim-treesitter/playground')

    -- netrw / nerd tree alternative file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end
    }

    -- Add LSP support
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- Automatically inject the accompanying pair for brackets
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Allows me to jump to any position in the visible editor area quickly
    use "ggandor/leap.nvim"

    -- Allows you to add files to your harpoon list and switch between them with keybindings
    use 'theprimeagen/harpoon'

    -- Allows you to visualise your undo history and have multiple undo branches
    use 'mbbill/undotree'

    -- Plugin for git
    use 'tpope/vim-fugitive'

    -- Plugin to show git status in gutter
    use 'lewis6991/gitsigns.nvim'

    -- Plugin to add vscode-like pictograms to neovim's builtin LSP.
    -- use 'onsails/lspkind-nvim'
    use {
        'onsails/lspkind-nvim',
        config = function ()
           require('lspkind').init()
        end
    }

    ------------- themes ---------------
    use 'Shatur/neovim-ayu'
    use 'rainglow/vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
