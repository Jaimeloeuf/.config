local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.completion.spell,

        -- @todo Should this be eslint_d and prettierd instead? What is the diff?
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier,
    },

    -- This is used to implement format on save.
    -- Every time null-ls is attached to the current buffer, check if the
    -- client supports formatting, and if it does, add an autocmd group to
    -- format the current buffer before writing.
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,

                        -- Only format if LSP client is null-ls
                        filter = function()
                            return client.name == "null-ls"
                        end,
                    })
                end,
            })
        end
    end
})

-- Add command for users to disable format on save in the current buffer.
vim.api.nvim_create_user_command(
    'DisableLspFormatting',
    function()
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
    end,
    { nargs = 0 }
)
