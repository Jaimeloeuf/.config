local telescope = require('telescope')
local builtin = require('telescope.builtin')

-- This allows me to search across all project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[p]roject [f]iles' })

-- This allows me to search only git files
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search only git files' })

-- This allows me to search through all the manual using telescope
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[f]ind [h]elp' })

-- Use telescope fuzzy finder to look for a string in current file
vim.keymap.set('n', '<leader>/',
    builtin.current_buffer_fuzzy_find,
    { desc = '[/] Fuzzily search in current buffer' }
)

-- Use telescope fuzzy finder to search through all files in project
vim.keymap.set('n', '<leader>lg',
    builtin.live_grep,
    { desc = '[l]ive [g]rep to fuzzily search through all files in project' }
)

-- Search for the word currently under the cursor
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input('Grep > ') })
-- end)


-- Load extensions

-- This extension will let telescope search through recently opened files
telescope.load_extension('recent_files')
-- Map a shortcut to open the picker.
vim.keymap.set('n', '<leader>prf',
    telescope.extensions.recent_files.pick,
    { noremap = true, silent = true, desc = '[p]roject [r]ecent [f]iles'  }
)
