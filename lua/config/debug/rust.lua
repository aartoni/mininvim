return {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            vim.fn.system("cargo build")
            local meta = vim.fn.json_decode(
                vim.fn.system("cargo metadata --format-version 1 --no-deps")
            )
            local target = vim.iter(meta.packages)
                :map(function(pkg) return pkg.targets end)
                :flatten()
                :find(function(t) return vim.tbl_contains(t.kind, "bin") end)
            return meta.workspace_root .. "/target/debug/" .. target.name
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        initCommands = function()
            local etc = vim.fn.trim(vim.fn.system("rustc --print sysroot"))
                .. "/lib/rustlib/etc"
            -- TODO Add Python to optdepends in PKGBUILD
            return {
                'command script import "' .. etc .. '/lldb_lookup.py"',
                'command source -s 0 "' .. etc .. '/lldb_commands"',
            }
        end,
    },
}
