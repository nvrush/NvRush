require('lspconfig').marksman.setup({
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "markdown.mdx" },
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "markdown.mdx" },
    root_dir = function(fname)
        return vim.fn.getcwd()
    end,
    -- Or suppress stderr
    flags = {
        debounce_text_changes = 150,
    },
})
