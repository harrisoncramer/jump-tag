# JumpTag 🏃

This repository is an extremely lightweight Neovim plugin that enables jumping to parent, sibling, and child tags. It's written in Lua and makes use of the Treesitter AST to quickly make the jumps.

It's designed to work for plain HTML, Vue and React.

![Demo](https://hjc-public.s3.amazonaws.com/demo.gif)

## Requirements

- Neovim 0.5+
- Treesitter

## Installation

Install with your favorite package manager, like Plug (or Packer, which is what I use):

```
use 'harrisoncramer/jump-tag'
```

## Features

This package does not provide any default mappings. You can call the functions directly or via mappings of your own. When hovering over a tag or anything inside of a tag (like it's attributes) you can call the following functions:

```
-- Jumps to the nearest parent
:lua require("jump-tag").jumpParent()

-- Jumps to the next sibling inside the current parent
:lua require("jump-tag").jumpNextSibling()

-- Jumps to the previous sibling inside the current parent
:lua require("jump-tag").jumpPrevSibling()

-- Jumps to the child of the current node
:lua require("jump-tag").jumpChild()
```

Here are the mappings that I use, because I prefer the jumpings to be on the `%` key:

```
vim.api.nvim_set_keymap('n', '<leader>55', ':lua require("jump-tag").jumpParent()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5n', ':lua require("jump-tag").jumpNexSibling()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5p', ':lua require("jump-tag").jumpPrevSibling()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>5c', ':lua require("jump-tag").jumpChild()<CR>', { noremap = true, silent = true})
```
