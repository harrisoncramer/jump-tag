# JumpTag

This repository is a Neovim plugin to enable jumping to parent and sibling tags. It's written in Lua and makes use of the Treesitter AST to quickly make the jumps.

# Installation

Install with your favorite package manager, like Plug or Packer:

```
use 'wbthomason/packer.nvim'
```

# Features

This package does not provide any default mappings by default. You can call the functions directly or via mappings.

When hovering over a tag, you can call the following functions:

- Jumps to the nearest parent
`:lua require("jump-tag").jumpParent()`

- Jumps to next sibling inside parent
`:lua require("jump-tag").jumpNextSibling()`

- Jumps to previous sibling inside parent
`:lua require("jump-tag").jumpPrevSibling()`

# Configuration

By default this plugin does not create any mappings for you.
