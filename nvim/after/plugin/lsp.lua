local lsp = require('lsp-zero').preset({
    name = 'recommended',
})

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
})

-- Copied from theprimeagen. Not sure if needed though.
-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')

lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        -- Allows me to use Enter to confirm suggestion. This will not auto
        -- select the first suggestion, you have to manually select it first
        -- before you hit enter.
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})

lsp.set_preferences({
    -- These are the characters used in the gutter when the levels occur.
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- Stuff from theprimeagen
-- This basically sets these functionalities per page buffer and allow you to
-- fallback to default implementations if LSP not found.
lsp.on_attach(function(client, bufnr)
    -- Use this if you just want to use the default keymaps.
    -- lsp.default_keymaps({buffer = bufnr})

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
