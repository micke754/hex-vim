# Mission
I would like to create my own configuration of neovim inspired heavily by the helix-editor.
- As much as is possible, I would like to have parity between this nvim config and helix so to stick to helix keybinds for similar operations.

- One big feature I want to implement is the using nvim.keymap from mini.nvim to immitate helix motions within neovim. To some extent I've done this already using the vim config options in options.lua

- I want to use lazy.nvim as my package manager as I'm already used to it and I like some of the other features.

- I terms of completions and language servers, I don't want to use mason to install tools, instead I've installed the necessary lsps and formatters already and they are exposed to the system path. 

- Use the config that i've created as a base and iterate on that with the exception of keybinds where I'm happy to take changes that will better match helix-editors' native keybindings.
