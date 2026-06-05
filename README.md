# odin4vim
A Vim and Neovim plugin to give native-feeling support for the [Odin](https://odin-lang.org/) programming language. Features include: syntax highlighting, proper indenting, `:compiler odin` to set makeprg with quickfix error handling, and `[[`/`]]` to jump between functions.

The highlighting has been made to very closely match Sublime's Odin highlighting (at least as much as possible given the editor differences). The syntax file and highlight groups should be very easy to read/modify/override for your preferences (there are some disabled optionals such as highlights for constant declarations, for example).

Written entirely in vimscript, so will work with Vim, as well as Neovim.

## Credits
- The ftplugin and indent files are almost 1:1 translated to old vimscript from [habamax/vim-odin](https://github.com/habamax/vim-odin), which is builtin to recent versions of both Vim and Neovim.
- The syntax file was forked from [Tetralux/odin.vim](https://github.com/Tetralux/odin.vim), which was derived from [jansedivy/jai.vim](https://github.com/jansedivy/jai.vim).
- A few bits and ideas for syntax were used from [mindhopper/nvim-odin](https://codeberg.org/mindhopper/nvim-odin).
- Some organization for syntax inspired by [Sublime's Odin syntax definitions](https://github.com/odin-lang/sublime-odin)

Yes, now there are at least 4 separate odin plugins for vim. You could make the fifth!

## Installation
- Manual: clone the repo into your vim config plugins folder
- [vim-plug](https://github.com/junegunn/vim-plug): `Plug 'auwsmit/odin4vim'`
- Neovim 0.12+ builtin: `vim.pack.add({ 'https://github.com/auwsmit/odin4vim' })`
- [lazy.nvim](https://github.com/folke/lazy.nvim): `{ 'auwsmit/odin4vim' }`

## Preview Screenshots
Font: [Fantasque Sans Mono, sans ligatures](https://github.com/spinda/fantasque-sans-ligatures)

[catppuccin](https://github.com/catppuccin/nvim) (comes with Vim v9.2.0219+ and Neovim 0.12+)
![Screenshot](https://i.imgur.com/8JTuqDo.png)

[habamax](https://github.com/habamax/vim-habamax) (comes with vim/nvim)
![Screenshot](https://i.imgur.com/HrpPSYR.png)

[badwolf](https://github.com/auwsmit/vim-baddog)
![Screenshot](https://i.imgur.com/WogbQPN.png)

unokai (comes with vim/nvim)
![Screenshot](https://i.imgur.com/T51YnvU.png)

### Why? What's wrong with the others?

- [habamax/vim-odin](https://github.com/habamax/vim-odin) has intentionally very minimal highlighting, but I wanted it to be more like Sublime's.
- [Tetralux/odin.vim](https://github.com/Tetralux/odin.vim) had simplistic/poor indenting support, no extra features, and the syntax file was pretty dated and disorganized (mostly due to being initially based on jai back in 2017).
- [mindhopper/nvim-odin](https://codeberg.org/mindhopper/nvim-odin) is impressive in its scope and features, but in my testing has a lot of odd edge cases and false-positives for highlights. It's just a bit "over-opinionated" for me, but again, is also really cool and impressive. You should check it out as an alternative to odin4vim!
