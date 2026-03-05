return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    init = function()
        local opt = vim.opt

        -- one column for folds
        opt.foldcolumn = "1"

        -- TODO: This is only available since Neovim v0.12 nightly branch hence, I should reinstall the official "neovim" pkg after v0.12 is out
        -- TODO: Use the foldopen and foldclose below once we fix the font
        -- vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
        vim.o.fillchars =
            "eob: ,fold: ,foldopen:-,foldsep: ,foldinner: ,foldclose:+"

        -- start with everything open, but foldable
        opt.foldlevel = 99
        opt.foldlevelstart = 99
        opt.foldenable = true
    end,
    config = function()
        local ufo = require("ufo")
        ufo.setup({
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
        })

        -- Open/close all folds
        vim.keymap.set("n", "zR", ufo.openAllFolds)
        vim.keymap.set("n", "zM", ufo.closeAllFolds)
    end,
}
