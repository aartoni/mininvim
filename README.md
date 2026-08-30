# mininvim

## Inspiration

These are some things I have read to get here:

* voidrice
* https://github.com/ntk148v/neovim-config
* https://github.com/NvChad/tinyvim
* https://vieitesss.github.io/posts/Neovim-new-config/
* 0 to LSP by The Primeagen

## Design

Tough decisions were made, here are the most notable ones:

* no mason:
    * we already have `pacman` for that
    * the tradeoff is having to define some bits by hand

As you can see, the focus of this project is finding the right balance between
readability and lines of code, relying on existing tools when available while
also avoiding bloat.

## To Do

* read all the inspirations and find things to adopt
* distribute as Arch package
* put branch name in the footer
* italic lowercase "d"s are cut to the right, this can be seen in treesitter.lua
* decide whether to add support for Avante or to incorporate Pi
* icons in DAP UI are cut (see by opening with `<leader>dr`)
* add support for LaTeX (parser, opening with Zathura and synctex)
* neotest Rust support is incomplete. The main issue is that neotest-rust is archived while the only alternative I could find (rustaceanvim) is too bloated. I should try to find another minimal version or make an effort at making it work again
    * what doesn't work: `<leader>to` on a test case opens the large entry instead of the specific test case; the large entry is not displayed correctly (a global `vim.env.NEXTEST_HIDE_PROGRESS_BAR = "1"` fixes it); I still have to test the remaining commands.
