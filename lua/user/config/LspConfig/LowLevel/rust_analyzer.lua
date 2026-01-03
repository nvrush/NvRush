local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
    flags = {
        debounce_text_changes = 300,
    },
    settings = {
        ["rust-analyzer"] = {
            -- IMPORTANT: avoid Cargo path mismatches
            checkOnSave = {
                enable = true,
                command = "check", -- Set to check use clippy instead
            },

            rustc = {
                source = "discover",
            },

            cargo = {
                allFeatures = false,
                buildScripts = {
                    enable = false,
                },
            },

            procMacro = {
                enable = false, -- For termux optimization
            },

            files = {
                excludeDirs = {
                    ".git",
                    "target",
                    "node_modules",
                },
            },

            diagnostics = {
                enable = true,
                experimental = {
                    enable = false,
                },
            },
        },
    },
})

-- local lspconfig = require("lspconfig")
-- lspconfig.rust_analyzer.setup({
--     flags = {
--         allow_incremental_sync = true,
--         debounce_text_changes = 500 -- Wait 150ms after typing stops
--     },
--     settings = {
--         ["rust-analyzer"] = {
--             rustc = {
--                 source = "discover",
--             },
--             files = {
--                 excludeDirs = { ".git", "target", "node_modules" }, -- Don't scan these
--             },
--             cargo = {
--                 buildScripts = {
--                     enable = false,
--                 },
--                 allFeatures = false,
--             },
--             checkOnSave = {
--                 enable = true,
--                 command = "clippy"
--             },
--             procMacro = {
--                 enable = true,
--                 attribute = {
--                     enable = false,
--                 },
--             },
--             diagnostics = {
--                 enable = true,
--                 experimental = {
--                     enable = false,
--                 }
--             },
--         },
--     },
-- })

vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
    return vim.NIL
end
