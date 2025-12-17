-- Minimal blink.cmp + LSP setup for maximum snippet expansion
-- Install: saghen/blink.cmp, neovim/nvim-lspconfig

-- ====================
-- 1. BLINK.CMP SETUP
-- ====================
require('blink.cmp').setup({
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
    },

    completion = {
        list = {
            max_items = 6, -- Show only 5-6 items
        },

        accept = {
            auto_brackets = {
                enabled = true,
            },
        },

        menu = {
            scrollbar = true,
            draw = {
                columns = {
                    { "label",     gap = 1 },
                    { "kind_icon", "kind", gap = 1 }
                },
            },
        },

        documentation = {
            auto_show = false, -- Docs OFF by default
            auto_show_delay_ms = 500,
            window = {
                border = 'rounded',
            },
        },

        ghost_text = {
            enabled = true,
        },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- keymap = {
    --     preset = 'default',
    --     ['<C-space>'] = { 'show', 'show_documentation' }, -- Manually trigger docs
    --     ['<C-e>'] = { 'hide', 'hide_documentation' },
    --     ['<CR>'] = { 'accept', 'fallback' },
    --     ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
    --     ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
    -- },


    keymap = {
        preset = 'default',
        ['<C-space>'] = { 'show', 'show_documentation' },
        ['<C-e>'] = { 'hide', 'hide_documentation' },
        ['<C-k>'] = { 'show_documentation', 'hide_documentation' }, -- Toggle docs with Ctrl+k
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' }, -- Scroll docs up
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' }, -- Scroll docs down
    },


    signature = {
        enabled = true,
    },
})

-- ====================
-- 2. LSP CAPABILITIES
-- ====================
local capabilities = require('blink.cmp').get_lsp_capabilities()

capabilities.textDocument.completion.completionItem = {
    snippetSupport = true,
    resolveSupport = {
        properties = { 'documentation', 'detail', 'additionalTextEdits' }
    },
    insertReplaceSupport = true,
    labelDetailsSupport = true,
}
