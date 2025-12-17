-- ====================
-- 1. LUASNIP SETUP
-- ====================
require('luasnip.loaders.from_vscode').lazy_load()

-- ====================
-- 2. LSP CAPABILITIES FOR CMP
-- ====================
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable maximum snippet support
capabilities.textDocument.completion.completionItem = {
    snippetSupport = true,
    resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    },
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    commitCharactersSupport = true,
    documentationFormat = { 'markdown', 'plaintext' },
    deprecatedSupport = true,
    preselectSupport = true,
}



--  For blink-cmp Uncomment this :
local blink_capabilities = require('blink.cmp').get_lsp_capabilities()

-- Enable maximum snippet support
blink_capabilities.textDocument.completion.completionItem = {
    snippetSupport = true,
    resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    },
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    commitCharactersSupport = true,
    documentationFormat = { 'markdown', 'plaintext' },
    deprecatedSupport = true,
    preselectSupport = true,
}

local servers = {
    --  Don't add anything here go to lua/user/config/LspConfig/ & make a file there or edit existing
}
vim.lsp.enable(vim.tbl_keys(servers))
vim.keymap.set("n", "<leader>la", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-- Add manual keybind (optional - trigger with <C-k> in insert mode)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })


-- -- Also add borders to diagnostic floating windows
-- vim.diagnostic.config({
--     float = {
--         border = "rounded",
--     },
-- })
