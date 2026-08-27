require("config.set")
require("config.remaps")
require("config.lazy")

local augroup = vim.api.nvim_create_augroup
local mininvim_group = augroup("mininvim", {})

local autocmd = vim.api.nvim_create_autocmd

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
    group = mininvim_group,
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 40 })
    end,
})

autocmd({ "BufWritePre" }, {
    group = mininvim_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

local lsp_maps = {
    { "gd", vim.lsp.buf.definition },
    { "K", vim.lsp.buf.hover },
    { "<leader>vws", vim.lsp.buf.workspace_symbol },
    { "<leader>vd", vim.diagnostic.open_float },
    { "<leader>vca", vim.lsp.buf.code_action },
    { "<leader>vrr", vim.lsp.buf.references },
    { "<leader>vrn", vim.lsp.buf.rename },
    { "<C-h>", vim.lsp.buf.signature_help, mode = "i" },
    { "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end },
    { "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end },
}

autocmd("LspAttach", {
    group = mininvim_group,
    callback = function(e)
        for _, map in ipairs(lsp_maps) do
            vim.keymap.set(map.mode or "n", map[1], map[2], { buffer = e.buf })
        end
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
