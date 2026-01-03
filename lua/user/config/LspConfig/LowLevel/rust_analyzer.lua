local lspconfig = require("lspconfig")


lspconfig.rust_analyzer.setup({
    flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 1000 -- Wait 150ms after typing stops
    },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                enable = true,
                command = "clippy"
            },
            procMacro = {
                enable = true,
            },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true
                }
            },
        },
    },
})

vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
    return vim.NIL
end
