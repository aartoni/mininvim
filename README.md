# mininvim

## Inspiration

These are some things I have read to get here:

* voidrice
* https://github.com/ntk148v/neovim-config
* https://github.com/NvChad/tinyvim
* https://vieitesss.github.io/posts/Neovim-new-config/
* 0 to LSP by The Primeagen

## To Do

* read all the inspirations and find things to adopt
* update plugins
* review folder structure
* test
* distribute as Arch package
* what can i lazy load? start from: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
* use "event", "keys", "cmd", "opts", "init" from lazy.nvim (see the conform conf)
* add at least 3 languages to the DAP configuration, and test them (Lua? C? Rust?)
* simplify code thanks to plenary macros
* put branch name in the footer
* italic lowercase "d"s are cut to the right, this can be seen in treesitter.lua
* decide whether to add support for Avante or to incorporate Pi
* icons in DAP UI are cut (see by opening with `<leader>dr`)
* add support for LaTeX (parser, opening with Zathura and synctex)
* neotest Rust support is incomplete. The main issue is that neotest-rust is archived while the only alternative I could find (rustaceanvim) is too bloated. I should try to find another minimal version or make an effort at making it work again
    * what doesn't work: `<leader>to` on a test case opens the large entry instead of the specific test case; the large entry is not displayed correctly (a global `vim.env.NEXTEST_HIDE_PROGRESS_BAR = "1"` fixes it); I still have to test the remaining commands.
* consider using lldb-dap instead of codelldb
    * CodeLLDB removed their native Rust formatters and adopted Python ones (see [changelog](https://github.com/vadimcn/codelldb/blob/master/CHANGELOG.md#1110))
