return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            local parsers = {
                "javascript",
                "typescript",
                "c",
                "lua",
                "rust",
                "jsdoc",
                "bash",
            }

            ts.install(parsers)

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
                pattern = "*",
                callback = function(args)
                    local buf = args.buf
                    local ft = args.match or vim.bo[buf].filetype
                    if not ft or ft == "" then
                        return
                    end

                    -- Map filetype -> parser name (e.g., typescriptreact -> tsx)
                    local ok_lang, lang =
                        pcall(vim.treesitter.language.get_lang, ft)
                    if not ok_lang or not lang then
                        lang = ft
                    end

                    if ts_should_disable(buf) then
                        return
                    end

                    local ok = pcall(vim.treesitter.start, buf, lang)
                    if not ok then
                        return
                    end

                    vim.bo[buf].indentexpr =
                        "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
