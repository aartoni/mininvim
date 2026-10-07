return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local parsers = {
                "bash",
                "c",
                "javascript",
                "jsdoc",
                "lua",
                "markdown",
                "markdown_inline",
                "rust",
                "toml",
                "typescript",
                "xml",
            }

            require("nvim-treesitter").install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("Treesitter", {}),
                pattern = vim.iter(parsers)
                    :map(vim.treesitter.language.get_filetypes)
                    :flatten()
                    :totable(),
                callback = function(args)
                    if pcall(vim.treesitter.start, args.buf) then
                        vim.bo[args.buf].indentexpr =
                            "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "BufReadPost",
    },
}
