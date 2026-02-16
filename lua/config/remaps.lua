-- Make space the leader key
vim.g.mapleader = " "

-- Project View: show the working directory in netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Persistent Paste: keep the clipboard when pasting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Black Hole Delete: don't store deleted text in clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- Quick Replace: replace the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Enable Execution: make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Move selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when merging lines
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor at the center when moving down/up half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor at the center when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep cursor in place when indenting paragraph
vim.keymap.set("n", "=ap", "ma=ap'a")

-- Keep cursor at the center when moving between quickfixes
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Keep cursor at the center when moving between locations
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")
