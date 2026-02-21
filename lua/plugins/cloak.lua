return {
    "laytan/cloak.nvim",
    commit = "648aca6d33ec011dc3166e7af3b38820d01a71e4",
    config = function()
        require("cloak").setup({
            patterns = {
                {
                    file_pattern = { ".env" },
                    cloak_pattern = "=.+",
                },
            },
        })
    end,
}
