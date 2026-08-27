local function run(opts)
    return function() require("neotest").run.run(opts) end
end

local nearest = run({ suite = false })
local suite = run({ suite = true })
local debug_nearest = run({ suite = false, strategy = "dap" })

local function all() require("neotest").run.run(vim.fn.getcwd()) end
local function summary() require("neotest").summary.toggle() end
local function output() require("neotest").output.open() end

return {
    "nvim-neotest/neotest",
    tag = "v5.13.4",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        { "<leader>tr", nearest, desc = "Test: nearest" },
        { "<leader>ts", suite, desc = "Test: suite" },
        { "<leader>td", debug_nearest, desc = "Test: debug nearest" },
        { "<leader>ta", all, desc = "Test: all" },
        { "<leader>tv", summary, desc = "Test: summary" },
        { "<leader>to", output, desc = "Test: output" },
    },
    opts = {},
}
