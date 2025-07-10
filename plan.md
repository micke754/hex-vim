# Plan for Helix-Inspired Neovim Configuration (Revision 2)

This revised plan addresses the shortcomings of the previous attempt. The primary goal is to emulate the Helix editor's modal, `select-then-act` workflow by prioritizing the use of `mini.nvim` modules and correctly mapping keys.

### 1. Core Philosophy: `select-then-act` via Visual Mode

Instead of introducing a complex new mode, I will leverage Neovim's Visual Mode to emulate Helix's selection-centric approach.

- **Normal Mode is for Selection:** Most motion keys in Normal Mode will not just move the cursor, but will instead select a text object and enter Visual Mode. For example, pressing `w` in Normal mode will select the current word (`viw`).
- **Visual Mode is for Action:** Keys like `d` (delete), `c` (change), and `y` (yank) will work on the existing selection in Visual Mode and then return the editor to Normal Mode.

### 2. Keymap Implementation with `mini.keymap`

I will use `mini.keymap` to create a clean and maintainable keymap configuration that reflects the Helix philosophy.

- **File:** A new, clean `lua/core/keymaps.lua` will be created.
- **Normal Mode Mappings:**
    - `w` -> `viw` (select word)
    - `l` -> `vl` (extend selection right)
    - `h` -> `vh` (extend selection left)
    - `p` -> `vip` (select paragraph)
    - And so on for other motions.
- **Action Mappings:** Standard Visual Mode keys (`d`, `c`, `y`) will be used.
- **Leader Keys:**
    - `<Space>` will be the leader for commands, primarily using Telescope (which is already installed) for file finding, searching, etc.
    - `g` will be the leader for LSP "goto" actions.

### 3. UI and Functionality with `mini.nvim`

I will remove the previously added plugins (`lualine`, `bufferline`) and use the `mini.nvim` suite as intended.

- **`mini.statusline`**: I will configure this to create a minimal and informative status line.
- **`mini.files`**: This will be configured to act as the file explorer, mapped to a key like `<Space>o`.
- **`mini.clue`**: I will use this to add keybinding hints, which is essential for learning and using the new modal system.
- **Other `mini` modules**: I will ensure that other existing `mini.nvim` modules like `mini.comment` and `mini.surround` are configured to work well within this new workflow.

### 4. Plugin Configuration and Integration

- **`init.lua`**: I will update the main `lazy.nvim` setup to correctly load all plugins from the `lua/plugins/` subdirectories (`ui`, `editor`, `lsp`).
- **LSP & Treesitter**: I will ensure the existing LSP and Treesitter configurations are correctly loaded and integrated with the new keymaps.

### 5. Execution

I will proceed with these changes methodically, one step at a time, to ensure each part is working correctly before moving to the next. I will not proceed until you approve this plan.