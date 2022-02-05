# Dave's Neovim IDE Config

## Overview
When I try to describe the mind-shatteringly joyful (read: dangerously obsessive) activity of trying to create my own Neovim config to people, I find the most compelling analogy is that of a Jedi who has reached that point in their training whereupon they're tasked with making their own lightsaber.

## Rough Goals
I want my IDE to:

- have parity with VS Code as a baseline (and preferably exceed it)
- be able to deploy on a remote server with very little effort
- be lightning quick on meagre hardware
- be easy to modify
- be beautiful

## Inspiration / Targets for Code Cannibalism
- [Christian Chiarulli's Neovim Config](https://github.com/ChristianChiarulli/nvim)
- [Lunarvim by Christian Chiarulli](https://github.com/LunarVim/LunarVim)
- [NvChad](https://github.com/NvChad/NvChad)

## Reference Material
- [Neovim Documentation](https://neovim.io/doc/user/)
- [Christian Chiarulli's 'Neovim from Scratch' series on YouTube](https://youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
- [Programming in Lua by Roberto Ierusalimschy](https://www.lua.org/pil/contents.html)

# To Do

## Completed
- 'jk' shortcut for Escape
- nice table and function format for keymaps and options
- auto-install Packer and plugins on fresh installation
- word wrap toggle shortcut (Leader-W)
- auto bracket pairs
- add keymaps for managing windows and buffers
- file explorer (nvim-tree)
- improve word wrap settings
- Zen Mode
- auto commenting (Comment)
- add tab line plugin (bufferline)
- treesitter (honestly just for Twilight right now)
- colour-matched brackets
- treesitter playground / highlight group identifying solution (ongoing)
- Twilight for Zen Mode (including hack to fix transparency issue)
- telescope with fzf
- setup LSP (Language Server Protocol)
- improve window pane management
- fix closing buffers
- add status line plugin (lualine or feline)
- F2 VS Code style symbol renaming

## Upcoming
- code completion (cmp)

## Unsorted
- add notifications to autocommands
- possibly collect autocommands into single module
- remap telescope close to match window close
- style gitsigns
- get telescope to respect project root cd
- git diff tools
- style feline
- add some themes
- code formatting
- linting
- notifications
- nvim-gps for breadcrumbs
- dashboard
- code folding
- improve bufferline appearance and functionality
- multi-cursor (select duplicates, extend cursor vertically, etc)
- resolve telescope vsplit / Ctrl-V paste clash
- neoclip for better clipboard
- see if we can get telescope bookmarks working
- glow markdown preview
- see if there's a fix for empty buffers hanging around
- logging
- terminal
- lazy-loading
- caching (impatient)
- project for dropping me in the right home folder
- add which-key and unify keymap config
- port [The Best Theme](https://github.com/jankohlbach/the-best-theme) from VS Code
- toggle transparent background (to enjoy nice tmux background images)
- custom colour scheme and ability to swap out for others while preserving transparent background
- better diagnostics
- TypeScript React snippets ala [dsznajder](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)
- find text in project
- shada file / change persistence after crash
- F2 rename symbol
- shortcut to see highlight group under cursor

## Abandoned
- telescope media files plugin (not possible on WSL yet?)