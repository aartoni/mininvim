local dir = vim.fn.stdpath("config") .. "/lua/config/debug"
local languages = {}

for name, kind in vim.fs.dir(dir) do
    local ft = name:match("^(.+)%.lua$")
    if kind == "file" and ft and ft ~= "init" then
        languages[ft] = require("config.debug." .. ft)
    end
end

return languages
