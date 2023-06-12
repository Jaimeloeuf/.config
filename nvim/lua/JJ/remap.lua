-- Use spacebar as leader key.
vim.g.mapleader = ' '

-- Keybinding to open up netrw file explorer.
-- Currently not using this since netrw is disabled for nvim-tree
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>pv', ':NvimTreeToggle<CR>')

-- Save file
vim.keymap.set('n', "<leader>s", vim.cmd.write)

-- This keybindings allow me to highlight lines in visual mode, and move the
-- whole block of text up and down using the move command. Similar to alt+up/down
-- from VS Code.
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keybinding to append next line to the end of current line with a space, while
-- keeping the cursor in the same position instead of moving it to the end of line.
vim.keymap.set('n', 'J', "mzJ`z")

-- This keybinding extends the C-d/u half page up/down jumping, by making sure
-- that the cursor always stays in the middle which helps you focus and easily
-- know where the cursor is after jumping around in the page.
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")

-- This keybinding ensures that search terms always stay in the middle of the
-- screen even as you jump to the next search result.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Copied from theprimeagen, greatest remap ever
-- This allows you to keep your current page buffer when you want to highlight
-- some text and paste from your current page buffer. E.g. so you whatever you
-- pasted over will not get saved into your current page buffer.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copied from theprimeagen, next greatest remap ever : asbjornHaland
-- This basically allows you to easily copy from nvim to system clipboard
vim.keymap.set({ 'n', 'v' }, "<leader>y", [["+y]])
vim.keymap.set('n', "<leader>Y", [["+Y]])

-- This allows me to delete into void register (i.e. dont save deleted contents)
vim.keymap.set({ 'n', 'v' }, "<leader>d", [["_d]])

-- This allows me to use the same esc alternative in vertical edit mode to save
-- the changes and reflect on allow lines.
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Removes keybinding for Ex mode which is not very useful
vim.keymap.set('n', "Q", "<nop>")

-- Used to format current file
vim.keymap.set('n', "<leader>f", vim.lsp.buf.format)

-- Start a file based search and replace for the current word that my cursor is on
vim.keymap.set('n', "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Prime said this is for quick fix list but not too sure, google and learn this
-- vim.keymap.set('n', "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set('n', "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set('n', "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set('n', "<leader>j", "<cmd>lprev<CR>zz")

-- This keybinding basically allows you make the current file executable without
-- having to do it yourself in the terminal. Not something I would use very often
-- so it is commented out for now.
-- vim.keymap.set('n', "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- This relies on tmux so not used for now.
-- vim.keymap.set('n', "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
