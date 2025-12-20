vim.keymap.set("n", "<Tab>", function()
    vim.cmd("bnext")
end)

vim.keymap.set("n", "<S-Tab>", function()
    vim.cmd("bprevious")
end)
