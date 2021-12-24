# Neovim Lua Plugin

This repository is a Neovim plugin template. Many thanks to <a href="https://github.com/ThePrimeagen">The Primeagen</a> for his <a href="https://www.youtube.com/watch?v=9L4sW047oow">tutorial</a>.

To work on the plugin, you must start Neovim with this directory as the current working directory. From within this directory, start up Neovim:

```
nvim --cmd "set rtp+=$(pwd) ."
```

This will automatically source the `your-first-plugin.vim` file, which contains a function. This function will re-source the Lua plugin that we're working on before calling the function it contains. This will ensure that we are calling the latest version of our code whenever we make edits.

We can call the vim function (and through it, the Lua function from our module) like this:

```
:call MyFirstPlugin()
```
