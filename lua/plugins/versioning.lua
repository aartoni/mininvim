local buf_maps = {
    { "<leader>p", function() vim.cmd.Git("push") end },
    { "<leader>P", function() vim.cmd.Git({ "pull", "--rebase" }) end },
}

return {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
        { "<leader>gs", vim.cmd.Git, desc = "Git status" },
        { "gu", "<cmd>diffget //2<CR>", desc = "Git diffget target" },
        { "gh", "<cmd>diffget //3<CR>", desc = "Git diffget merge" },
    },
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("Fugitive", {}),
            pattern = "fugitive",
            callback = function(args)
                for _, map in ipairs(buf_maps) do
                    vim.keymap.set("n", map[1], map[2], { buffer = args.buf })
                end
            end,
        })
    end,
}
