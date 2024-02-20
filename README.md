# neovim config

![nvim preview](./assets/nvim_alpha_preview.png)
 


* file structre

```bash

~/.config/nvim/lua
.
├── assets
│   └── nvim_alpha_preview.png
├── LICENSE
├── mistuba_TAKANASHI
│   ├── bootstrap.lua
│   ├── init.lua
│   ├── plugins
│   │   ├── 3rd-image.lua
│   │   ├── alpha.lua
│   │   ├── gitsigns.lua
│   │   ├── harpoon.lua
│   │   ├── heirline.lua
│   │   ├── lazygit.lua
│   │   ├── lsp-config.lua
│   │   ├── neo-tree.lua
│   │   ├── nvim-colorizer.lua
│   │   ├── nvim-telescope.lua
│   │   ├── nvim-treesitter.lua
│   │   ├── nvim-ufo.lua
│   │   ├── rose-pine.lua
│   │   ├── undotree.lua
│   │   └── which-key.lua
│   └── setup
│       ├── mappings.lua
│       └── options.lua
└── README.md

5 directories, 22 files

```

## dependencey

magick for image preview
`sudo luarocks --lua-version=5.1 install magick`

option dependencies
`ripgrep & lazygit`

## backeup your config
``` bash 
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```


## setup 

* create needed dir if not present 
`mkdir -p ~/.config/nvim/lua && cd ~/.config/nvim/lua`

* clone repo
`git clone --depth=1 https://github.com/Himanshu-Parangat/mistuba_nvim .`

* require the new user config 
`echo "require("mistuba_TAKANASHI")" >> hi.lua`

## removal 
```bash
rm -r ~/.config/nvim 
rm -r ~/.local/share/nvim 
```


## todo 
* setup which key
* setup undo tree
* setup statusline
