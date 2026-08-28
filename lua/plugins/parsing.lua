return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
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

            ts.install(parsers)

            local filetypes = vim.iter(parsers)
                :map(vim.treesitter.language.get_filetypes)
                :flatten()
                :totable()

            local function ts_should_disable(buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local filename = vim.api.nvim_buf_get_name(buf)
                local stats = vim.uv.fs_stat(filename)
                if stats and stats.size > max_filesize then
                    vim.notify(
                        "File larger than 100 KB, Treesitter disabled for performance",
                        vim.log.levels.WARN,
                        { title = "Treesitter" }
                    )
                    return true
                end

                return false
            end

            local group =
                vim.api.nvim_create_augroup("Treesitter", { clear = true })

            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                pattern = filetypes,
                callback = function(args)
                    if ts_should_disable(args.buf) then
                        return
                    end

                    if not pcall(vim.treesitter.start, args.buf) then
                        return
                    end

                    vim.bo[args.buf].indentexpr =
                        "v:lua.require'nvim-treesitter'.indentexpr()"
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
