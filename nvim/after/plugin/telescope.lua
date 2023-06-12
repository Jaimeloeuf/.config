local builtin = require('telescope.builtin')

-- This allows me to search across all project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- This allows me to search only git files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- copied from theprimeagen
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input('Grep > ') })
-- end)
