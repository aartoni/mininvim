local languages = {}

vim.iter(vim.api.nvim_get_runtime_file("lua/config/debug/*.lua", true))
    :map(function(path) return vim.fn.fnamemodify(path, ":t:r") end)
    :filter(function(ft) return ft ~= "init" end)
    :each(function(ft) languages[ft] = require("config.debug." .. ft) end)

return languages
