-- Config file for 'theprimeagen/harpoon'

require("harpoon").setup({
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    menu = {
        -- Use a dynamic width for the harpoon popup menu by setting the menu's
        -- width relative to the current window's width.
        -- width = vim.api.nvim_win_get_width(0) - 4,

        -- Currently using fixed width since the width can get too long
        -- following window width.
        width = 60,
    },
})

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

-- Keybindings for toggling between the first 4 harpoon files
-- vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
-- vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
-- vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
-- vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)
