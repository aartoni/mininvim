return {
    "laytan/cloak.nvim",
    event = "BufReadPre",
    opts = {
        patterns = {
            {
                file_pattern = { ".env" },
                cloak_pattern = "=.+",
            },
        },
    },
}
