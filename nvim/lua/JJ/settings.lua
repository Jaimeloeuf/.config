-- Enforce the default cursor to turn thin in insert mode 
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'

vim.cmd.colorscheme('tonic')

-- disable netrw so that nvim-tree plugin can take over
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Adds relative line number to the gutter
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 8

-- Stop nvim from doing backups, instead let undotree plugin access to the long
-- running undos, so that it can access undos very far back and across sessions.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Prevent search terms from staying highlighted after the search and allow
-- incremental search so that you can use things like wildcards e.g. '/vim.* ='
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Use good colors for theming
vim.opt.termguicolors = true

-- This gives spacing in the gutter for signs/symbols to be displayed by plugins
-- such as to show your LSP suggestions or git status for that particular line.
-- "yes" always reserves some space to show the signs, while "number" will show
-- the sign by replacing the line number space.
vim.opt.signcolumn = "yes"

-- This ensures support for most file names out there
vim.opt.isfname:append("@-@")

-- Write swap file to disk after nothing is typed for this number of milliseconds
-- Faster is good because the faster the swap file updates the faster the plugins
-- that rely on swap file information can update, such as updating of the git gutter
-- on text change. However this must be balanced with writing too frequently to
-- disk which might not be good for some SSD setups.
-- https://neovim.io/doc/user/options.html
-- https://www.reddit.com/r/vim/comments/8qvjnv/is_updatetime_parameter_good_for_vim/
vim.opt.updatetime = 120

-- Show ruler at column 80 to help visually identify when a line break should
-- ideally occur at.
vim.opt.colorcolumn = "80"
