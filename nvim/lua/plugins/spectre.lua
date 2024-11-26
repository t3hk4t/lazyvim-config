return {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
        require("spectre").setup({
            mapping = {
                -- Customize keybindings here if needed
            },
        })
    end,
    -- Optionally, set up LazyVim-style keybindings
    keys = {
        {
            "<leader>S",
            function()
                require("spectre").open()
            end,
            desc = "Open Spectre",
        },
        {
            "<leader>Sw",
            function()
                require("spectre").open_visual({ select_word = true })
            end,
            desc = "Search current word",
        },
        {
            "<leader>Sf",
            function()
                require("spectre").open_file_search()
            end,
            desc = "Search in current file",
        },
    },
}
