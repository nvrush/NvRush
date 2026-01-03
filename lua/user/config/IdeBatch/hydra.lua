local Hydra = require("hydra")

Hydra({
    name = "Window Management",
    mode = "n",
    body = "<leader>w",
    heads = {
        { "h", "<C-w>h", { desc = "Move left" } },
        { "j", "<C-w>j", { desc = "Move down" } },
        { "k", "<C-w>k", { desc = "Move up" } },
        { "l", "<C-w>l", { desc = "Move right" } },

        { "s", "<C-w>s", { desc = "Horizontal split" } },
        { "v", "<C-w>v", { desc = "Vertical split" } },

        { "q", nil,      { exit = true, desc = "Quit Hydra" } },
    }
})
