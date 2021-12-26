# JumpTag 🏃

This repository is an extremely lightweight Neovim plugin that enables jumping to parent and sibling tags. It's written in Lua and makes use of the Treesitter AST to quickly make the jumps.

It's designed to work for plain HTML, Vue and React.

![Demo](https://hjc-public.s3.us-east-1.amazonaws.com/demo.gif?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIApDQRSjwauk%2FJLOT4KTOGx14aqdGUA0xhnl82oMQ3NTAiEA9gaccXiRGgR9rqbXA6A1Ls0yLxgqeBS4bBjoCGpprwkqgwMIgP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwwMTU2MTExODQ1MjMiDO5LbEWdLz4jRqr08irXArOrUPd%2F4eHaUNrGm0IVmotuNwMRPF95VhEPtS0eUBV9MJJQQRQSEllnQgzhClFUnACelz57KS4v5tZg9XVzUTOaLa30eRDGVTaakQP1a%2FKc%2Bgf1XkdIAV8FAfyD%2BLu1o2dmeEvbw1PDuZE3rIebfWpjR83AR63tlVkJAQGq9KUGsFBfbP%2F22D442HRfSZLQgmZ7MTTvyVSikpXDcpHHStAjZBpaal6NwvbUQ%2FLyvvX%2FxLQbC6QinvGlH4QYH5817cuYXSYh7%2FveYJm%2FreGjr7kG7%2BQAC5iSKn1KsPTOkVGUvZCn3kLbkCIo2kFvoFPaEQfkpGcLlSg3aETY681gM5MOikK9O8oPWWIiERMlFwpaG2t5NE1G6jQ9OAPxd6aAb3lTgDE7%2FpeoUwowYO5zU18SdFmax3X4Hhh46KG44%2BdhWx732l29KJrTaE3ZkVDCxvfJMjD10IEwwLaejgY6swIgwr8CD62EDfvkx0gq0rHZ6QpKKgwm3lsjkiDhbx%2FAe1OkLHaGcCpQseoiMW5ZLHcJqnqOjs6UoXbzKCoImbl0uMykF4qiw7vjhcVp2mqlP%2BUkCH5BRjEjzLYFoJJjXK9qSqtJPmGhttLd0qBSXYAPkP3ZdhJvRk9RSWd1D%2F37hy9PrJUl1q1Eok9p4KHilIuyQZdmgOiQkWaq9jFeYyJGPyoM4lVOu41imAED%2BNwndYHJnoGxqs8JG6BJeF3%2B7C%2FMGFS78NFBrLli9fdZUApeEbkFlscFCfGQ3MDceD1ZW7N8pT1d93ktK%2FAgMO4K9cGeosGTJ4EULuE8HhNPyXnh8pTIVFGydcCDgEcsekIa9xF%2FDOE22Fak%2BTx53LYzWAA1GwghD3AtPIIKkbsBVWsuCw%2Fw&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20211225T223129Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQHIT7YWFS7UMYMXD%2F20211225%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=cdf72c3e00dd4f0a66c9fa796f213b559a63dc5fd824a0237b5beae7899b63f6)

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
