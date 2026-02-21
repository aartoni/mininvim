return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    tag = "v9.1.0",
    opts = {},
    config = function()
        require("conform").setup({
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                c = { "clang-format" },
                cpp = { "clang-format" },
                elixir = { "mix" },
                go = { "gofmt" },
                javascript = { "prettier" },
                lua = { "stylua" },
                rust = { "rustfmt" },
                typescript = { "prettier" },
            },
            formatters = {
                ["clang-format"] = { prepend_args = { "-style=file" } },
            },
        })

        vim.keymap.set("n", "<leader>f", function()
            require("conform").format()
        end)
    end,
}
