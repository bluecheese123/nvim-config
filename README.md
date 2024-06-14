# My personal neovim config catered to writing LaTeX.

This serves as my base configuration for Neovim incase I break something while I keep adding more plugins for seemingly no good reason!\

Its based on the LazyVim distro using lazy.vim as the package manager. Read about it [here](http://www.lazyvim.org/).\

## Key components

1. LazyVim and its core plugins like telescope, nvim-treesitter and many more which you can read about [here](http://www.lazyvim.org/plugins).
2. [Autopairs](https://github.com/windwp/nvim-autopairs) provides support for adding new bracket pairs for bracket matching, that are relevant to TeX (like _'$...$'_ for inline math).
3. [LuaSnip](https://github.com/L3MON4D3/LuaSnip), which is the snippet engine that manages and expands our snippets (Best snippet engine as of now imo).
4. [VimTeX](https://github.com/lervag/vimtex), which makes neovim LaTeX writing possible!
5. [nvim-UFO](https://github.com/kevinhwang91/nvim-ufo) - An amazing plugin that provides support for both custom folding and syntax based folding with great customisability.
6. [Oil](https://github.com/stevearc/oil.nvim) - A file explorer that lets you edit your filesystem like a normal Neovim buffer.
    > **_NOTE:_** I've disabled this by default. To enable it, go to the file _oil.lua_ and set `disabled = false`.\\


Why is this public? While it might worthwhile for software devs to actually sit and figure out how to edit lua configs for neovim, it might not be an efficient use of time to worry about breaking changes for a lot of math and CS theoreticians who just want a way to not spend too much time writing articles and academic papers. Although, if you got time, I do suggest writing your own configs either from scratch or on top of a distro like LazyVim. Also, I've not put any effort into commenting any of the files, I promise I'll do it sometime in the future.
