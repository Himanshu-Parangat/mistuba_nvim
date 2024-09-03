# 🌸🌸neovim config🌸🌸

![nvim preview](./assets/nvim_alpha_dashboard_preview.png)

- file structre

```bash

~/.config/nvim/lua

.
├── README.md
├── LICENSE.md
├── init.lua
├── lua
│   └── mistuba_Takanashi
│       ├── bootstrap.lua
│       ├── icons
│       │   └── default.lua
│       ├── init.lua
│       ├── lsp
│       │   ├── init.lua
│       │   ├── lsp_conf
│       │   │   ├── jsonls.lua
│       │   │   ├── lua_ls.lua
│       │   │   └── pyright.lua
│       │   └── lspconfig.lua
│       ├── plugins
│       │   ├── alpha.lua
│       │   ├── cmp.lua
│       │   ├── colorizer.lua
│       │   ├── colorschemes.lua
│       │   ├── comment.lua
│       │   ├── conform.lua
│       │   ├── gitsigns.lua
│       │   ├── harpoon.lua
│       │   ├── indent-blankline.lua
│       │   ├── lazydev.lua
│       │   ├── lsp-mason-bundle.lua
│       │   ├── lualine.lua
│       │   ├── navic-bundle.lua
│       │   ├── neo-tree.lua
│       │   ├── nvim-lint.lua
│       │   ├── nvim-ufo.lua
│       │   ├── statuscol.lua
│       │   ├── telescope.lua
│       │   ├── toggleterm.lua
│       │   ├── treesitter.lua
│       │   ├── trouble.lua
│       │   └── which-key.lua
│       ├── setup
│       │   ├── mappings.lua
│       │   └── options.lua
│       └── utils.lua
├── lazy-lock.json
└── assets
    └── nvim_alpha_dashboard_preview.png

9 directories, 38 files


```

## dependencey

option dependencies
`sudo pacman -S ripgrep`

## backeup your config

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

## setup

- create needed dir if not present

```bash
mkdir -p ~/.config/nvim/ && cd ~/.config/nvim/
```

- clone repo

```bash
git clone --depth=1 https://github.com/Himanshu-Parangat/mistuba_nvim ~/.config/nvim/
```

## removal

```bash
rm -r ~/.config/nvim
rm -r ~/.local/share/nvim
```

## todo

- rework on lsp keybind
- rework completion key press 
- setup spell check
- setup undo tree
- better diff
- gitsigns keybinds
- image preview
- json schema
- setup debug adapter
- setup org mode `(optional)`
