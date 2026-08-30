return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
        },
        init = function() vim.g.undotree_SetFocusWhenToggle = 1 end,
    },
    {
        "laytan/cloak.nvim",
        event = "BufReadPre",
        opts = {
            patterns = {
                { file_pattern = { ".env" }, cloak_pattern = "=.+" },
            },
        },
    },
}
