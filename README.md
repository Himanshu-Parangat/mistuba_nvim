# 🌸🌸neovim config🌸🌸

![nvim preview](./assets/nvim_alpha_dashboard_preview.png )
 


* file structre

```bash

~/.config/nvim/lua


.
├── README.md
├── LICENSE.md
├── init.lua
├── lazy-lock.json
├── lua
│   └── mistuba_Takanashi
│       ├── bootstrap.lua
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
│       │   ├── gitsigns.lua
│       │   ├── harpoon.lua
│       │   ├── indent-blankline.lua
│       │   ├── lsp-mason-bundle.lua
│       │   ├── lualine.lua
│       │   ├── neo-tree.lua
│       │   ├── telescope.lua
│       │   ├── treesitter.lua
│       │   └── trouble.lua
│       ├── setup
│       │   ├── mappings.lua
│       │   └── options.lua
│       └── utils.lua
└── assets
    └── nvim_alpha_dashboard_preview.png

8 directories, 29 files

```

## dependencey

option dependencies
`sudo pacman -S ripgrep`

## backeup your config
``` bash 
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

## setup 

* create needed dir if not present 
```bash
mkdir -p ~/.config/nvim/ && cd ~/.config/nvim/
```

* clone repo
```bash
git clone --depth=1 https://github.com/Himanshu-Parangat/mistuba_nvim ~/.config/nvim/
```

## removal 
```bash
rm -r ~/.config/nvim 
rm -r ~/.local/share/nvim 
```


## todo 
* setup which key
* setup undo tree
* setup debug adapter
* setup org mode `(optional)` 
