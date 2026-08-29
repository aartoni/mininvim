return {
    "neovim/nvim-lspconfig",
    tag = "v2.11.0",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "j-hui/fidget.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        vim.lsp.config("*", { capabilities = capabilities })

        vim.lsp.config("lua_ls", {
            settings = { Lua = { runtime = { version = "LuaJIT" } } },
        })

        require("fidget").setup({})
        require("mason").setup()
        -- TODO Add these to optdepends as it doesn't break, it only notifies
        -- the user that the package is not installed if they try to open a file
        -- requiring an unsupported language server.
        vim.lsp.enable({ "clangd", "lua_ls", "rust_analyzer" })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end,
}
