local function jump(n)
    return function() require("luasnip").jump(n) end
end

local function expand() require("luasnip").expand() end

local function next_choice()
    local ls = require("luasnip")
    if ls.choice_active() then
        ls.change_choice(1)
    end
end

return {
    "L3MON4D3/LuaSnip",
    tag = "v2.5.0",
    -- TODO Move jsregexp to PKGBUILD optdepend
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    keys = {
        { "<C-s>e", expand, mode = "i", silent = true },
        { "<C-s>;", jump(1), mode = { "i", "s" }, silent = true },
        { "<C-s>,", jump(-1), mode = { "i", "s" }, silent = true },
        { "<C-E>", next_choice, mode = { "i", "s" }, silent = true },
    },
    config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
}
