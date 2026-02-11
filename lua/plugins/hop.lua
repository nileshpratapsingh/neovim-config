return {
    {
        "smoka7/hop.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("hop").setup()
            vim.keymap.set("n", "fw", ":HopWord<CR>", { silent = true })
            vim.keymap.set("n", "fl", ":HopLine<CR>", { silent = true })
        end,
    },
}
