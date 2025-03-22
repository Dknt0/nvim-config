This is my Neovim config based on [NvChad](https://github.com/NvChad/nvchad), aiming to be deployed from scratch within 2 minutes.

A Neovim version later than 0.10 is required. You can install the latest released neovim from github, or you can install it with `snap`.

```shell
curl -L https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage > nvim
chmod 775 nvim
```

Then install the config:

```shell
# Install dependencies
sudo apt install git curl wget nodejs npm python3-venv ripgrep
# Clone the repository
git clone https://github.com/Dknt0/nvim-config ~/.config/nvim/ && nvim
# To install LSP plugins, type this command in nvim
:MasonInstallAll
```

> Below is the original README from NvChad

---

**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
