local function run(opts)
    return function() require("neotest").run.run(opts) end
end

local nearest = run({ suite = false })
local suite = run({ suite = true })
local debug_nearest = run({ suite = false, strategy = "dap" })

local function summary() require("neotest").summary.toggle() end
local function output() require("neotest").output.open() end

return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "rouge8/neotest-rust",
    },
    keys = {
        { "<leader>tr", nearest, desc = "Test: nearest" },
        { "<leader>ts", suite, desc = "Test: suite" },
        { "<leader>td", debug_nearest, desc = "Test: debug nearest" },
        { "<leader>tv", summary, desc = "Test: summary" },
        { "<leader>to", output, desc = "Test: output" },
    },
    opts = function() return { adapters = { require("neotest-rust") } } end,
}
-- TODO Add cargo-nextest to optdepends
