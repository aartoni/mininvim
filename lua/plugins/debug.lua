local panels = {
    { "dr", "repl" },
    { "ds", "stacks" },
    { "dS", "scopes" },
    { "dc", "console" },
    { "dw", "watches" },
    { "db", "breakpoints" },
}

local layouts, index, panel_keys = {}, {}, {}

for i, panel in ipairs(panels) do
    local key, name = panel[1], panel[2]
    layouts[i] = { elements = { name }, size = 40, position = "right" }
    index[name] = i
    panel_keys[i] = {
        "<leader>" .. key,
        function()
            require("dapui").toggle({ layout = index[name] })
        end,
        desc = "Debug: toggle " .. name .. " ui",
    }
end

local function navigate(args)
    local win = vim.fn.win_findbuf(args.buf)[1]
    if not win then
        return
    end
    vim.schedule(function()
        if vim.api.nvim_win_is_valid(win) then
            if vim.bo[args.buf].filetype == "dap-repl" then
                vim.wo[win].wrap = true
            end
            vim.api.nvim_set_current_win(win)
        end
    end)
end

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = { "williamboman/mason.nvim" },
                cmd = { "DapInstall", "DapUninstall" },
                opts = {
                    ensure_installed = { "codelldb" },
                    handlers = {},
                },
            },
        },
        -- stylua: ignore
        keys = {
            { "<F8>", function() require("dap").continue() end, desc = "Debug: Continue" },
            { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
            { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
            { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
            { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
            { "<leader>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition:")) end, desc = "Debug: Set Conditional Breakpoint" },
        },
        config = function()
            require("dap").configurations = require("config.debug")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        keys = panel_keys,
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            vim.api.nvim_create_autocmd("BufWinEnter", {
                group = vim.api.nvim_create_augroup("Dap", { clear = true }),
                pattern = { "*dap-repl*", "DAP *" },
                callback = navigate,
            })

            ---@diagnostic disable-next-line: missing-fields
            dapui.setup({ layouts = layouts })

            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}
