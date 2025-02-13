This is my Neovim config based on [NvChad](https://github.com/NvChad/nvchad). A Neovim version later than 0.10 is required.

Usage:

```shell
# Install dependencies
sudo apt install git curl wget nodejs npm
# Clone the repository
git clone https://github.com/Dknt0/nvim-config ~/.config/nvim/ && nvim
# To install LSP plugins, type this command in nvim
:MasonInstallAll
```

**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
