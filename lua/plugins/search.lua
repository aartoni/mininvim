local function builtin(name, opts)
    return function() require("telescope.builtin")[name](opts) end
end

local function grep_word(pattern)
    return function()
        local word = vim.fn.expand(pattern)
        require("telescope.builtin").grep_string({ search = word })
    end
end

local function grep_input()
    local search = vim.fn.input("Grep > ")
    require("telescope.builtin").grep_string({ search = search })
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>pf", builtin("find_files"), desc = "Find files" },
        { "<C-p>", builtin("git_files"), desc = "Git files" },
        { "<leader>vh", builtin("help_tags"), desc = "Help tags" },
        { "<leader>pws", grep_word("<cword>"), desc = "Grep word" },
        { "<leader>pWs", grep_word("<cWORD>"), desc = "Grep WORD" },
        { "<leader>ps", grep_input, desc = "Grep prompt" },
    },
    opts = {},
}
