-- Show relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Share X.Org clipboard
vim.opt.clipboard:append("unnamedplus")

-- Use 4 spaces as tab, display actual tabs as 4 spaces wide
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Properly indent in scopes
vim.opt.smartindent = true

-- Disable word wrap
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("XDG_DATA_HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
