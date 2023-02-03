<h1 align="center">
    neovim config
    <br>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
    <img
        alt="NeoVim Version Capability"
        src="https://img.shields.io/badge/Supports%20Nvim-v0.8-A6D895?style=for-the-badge&colorA=363A4F&logo=neovim&logoColor=D9E0EE">
    </a>
</h1>

## 🪷 Introduction

The project is based on [ayamir/nvimdots](https://github.com/ayamir/nvimdots) and some adjustments have been made, most of the content remains the same.

This repo hosts my [NeoVim](https://neovim.io/) configuration for Linux, macOS, and Windows. `init.lua` is the config entry point.

It contains two branches:
| Branch | Completion Solution |
| :----: | :------------------------: |
| main | config for nvim 0.8 stable |
| 0.7 | config for nvim 0.7 stable |

I use [lazy.nvim](https://github.com/folke/lazy.nvim) to manage plugins.

### 🎐 Features

- **Fast.** Less than **30ms** to start (Depends on SSD and CPU, tested on Zephyrus G14 2022 version).
- **Simple.** Run out of the box.
- **Modern.** Pure `lua` config.
- **Modular.** Easy to customize.
- **Powerful.** Full functionality to code.

## ⚙️ Configuration & Usage

<h3 align="center">
    🗺️ Keybindings
</h3>
<p align="center">Refer to <a href="https://github.com/ayamir/nvimdots/wiki/Keybindings" rel="nofollow">Wiki: Keybindings</a></p>
<br>

<h3 align="center">
    🔌 Plugins & Deps
</h3>
<p align="center">Refer to <a href="https://github.com/ayamir/nvimdots/wiki/Plugins" rel="nofollow">Wiki: Plugins</a> <br><em>(You can also find a deps diagram there!)</em></p>
<br>

<h3 align="center">
    🔧 Usage & Customization
</h3>
<p align="center">Refer to <a href="https://github.com/ayamir/nvimdots/wiki/Usage" rel="nofollow">Wiki: Usage</a></p>
<br>

## ✨ Features

<h3 align="center">
    ⏱️  Startup Time
</h3>

<p align="center">
  <img src="https://raw.githubusercontent.com/ayamir/blog-imgs/main/startuptime.png"
  width = "80%"
  alt = "StartupTime"
  />
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/ayamir/blog-imgs/main/vimstartup.png"
  width = "60%"
  alt = "Vim-StartupTime"
  />
</p>

> Tested with [rhysd/vim-startuptime](https://github.com/rhysd/vim-startuptime)

<h3 align="center">
    📸 Screenshots
</h3>

<p align="center">
    <img src="https://raw.githubusercontent.com/ayamir/blog-imgs/main/dashboard.png" alt="Dashboard">
    <em>Dashboard</em>
</p>
<br>

<p align="center">
    <img src="https://raw.githubusercontent.com/ayamir/blog-imgs/main/telescope.png" alt="Telescope">
    <em>Telescope</em>
</p>
<br>

<p align="center">
    <img src="https://raw.githubusercontent.com/ayamir/blog-imgs/main/coding.png" alt="Coding">
    <em>Coding</em>
</p>
<br>

<p align="center">
    <img src="https://raw.githubusercontent.com/ayamir/blog-imgs/main/dap.png" alt="Debugging">
    <em>Debugging</em>
</p>
<br>

<p align="center">
    <img src="https://raw.githubusercontent.com/ayamir/blog-imgs/main/gitui.png" alt="Lazygit">
    <em>Lazygit with built-in Terminal</em>
</p>
<br>

<p align="center">
    <img src="https://raw.githubusercontent.com/ayamir/blog-imgs/main/legendary.png" alt="Legendary">
    <em>Command quickref</em>
</p>

## 👐 Contributing

- If you find anything that needs improving, do not hesitate to point it out or create a PR.
- If you come across an issue, you can first use `:checkhealth` command provided by nvim to trouble-shoot yourself.
  - If you still have such problems, feel free to open a new issue!

## ❤️ Thanks to

- [ayamir](https://github.com/ayamir)
- [Jint-lzxy](https://github.com/Jint-lzxy)
- [CharlesChiuGit](https://github.com/CharlesChiuGit)

## 🎉 Acknowledgement

- [glepnir/nvim](https://github.com/glepnir/nvim)

## 📜 License

This NeoVim configuration is released under the MIT license, which grants the following permissions:

- Commercial use
- Distribution
- Modification
- Private use

For more convoluted language, see the [LICENSE](https://github.com/ayamir/nvimdots/blob/main/LICENSE).
