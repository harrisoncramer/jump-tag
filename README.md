# JumpTag 🏃

This repository is a Neovim plugin to enable jumping to parent and sibling tags. It's written in Lua and makes use of the Treesitter AST to quickly make the jumps.

## Requirements

- Neovim 0.5+
- Treesitter

## Installation

Install with your favorite package manager, like Plug (or Packer, which is what I use):

```
use 'wbthomason/packer.nvim'
```

## Features

This package does not provide any default mappings by default. You can call the functions directly or via mappings of your own. When hovering over a tag, you can call the following functions:

```
-- Jumps to the nearest parent
:lua require("jump-tag").jumpParent()

-- Jumps to the next sibling inside the current parent
:lua require("jump-tag").jumpNextSibling()

-- Jumps to the previous sibling inside the current parent
:lua require("jump-tag").jumpPrevSibling()
```

Here are the mappings that I use:

```
vim.api.nvim_set_keymap('n', '<leader>55', ':lua require("jump-tag").jumpParent()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5n', ':lua require("jump-tag").jumpNexSibling()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5p', ':lua require("jump-tag").jumpPrevSibling()<CR>', { noremap = true, silent = true})
```

## Configuration

By default this plugin does not create any mappings for you.
