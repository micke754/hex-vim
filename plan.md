# Plan for Helix-Inspired Neovim Configuration (Revision 2)

This revised plan addresses the shortcomings of the previous attempt. The primary goal is to emulate the Helix editor's modal, `select-then-act` workflow by prioritizing the use of `mini.nvim` modules and correctly mapping keys.

### 1. Core Philosophy: `select-then-act` via Visual Mode

Instead of introducing a complex new mode, I will leverage Neovim's Visual Mode to emulate Helix's selection-centric approach.

- **Normal Mode is for Selection:** Most motion keys in Normal Mode will not just move the cursor, but will instead select a text object and enter Visual Mode. For example, pressing `w` in Normal mode will select the current word (`viw`).
- **Visual Mode is for Action:** Keys like `d` (delete), `c` (change), and `y` (yank) will work on the existing selection in Visual Mode and then return the editor to Normal Mode.

### 2. Keymap Implementation with `mini.keymap`

I have implemented a comprehensive Helix-inspired keymap configuration using Neovim's native mapping and `mini.keymap`.

#### Key Features Implemented:

1. **Selection-First Text Objects**
   - `mip`: Select inside paragraph
   - `miw`: Select inside word

2. **Goto Mode (`g` prefix)**
   - `gd`: Goto definition
   - `gr`: Goto references
   - `gi`: Goto implementation
   - `gy`: Goto type definition
   - `gf`: Goto file under cursor

3. **Match/Surround Mode (`m` prefix)**
   - `mm`: Match bracket
   - `ms`: Surround selection
   - `mr`: Replace surround
   - `md`: Delete surround

4. **View Mode (`z` prefix)**
   - `zz`: Center cursor line
   - `zt`: Cursor line to top
   - `zb`: Cursor line to bottom
   - `zh`, `zl`: Horizontal scrolling

5. **Space Mode (`<Space>` prefix)**
   - `<Space>f`: Find files
   - `<Space>b`: Find buffers
   - `<Space>s`: Document symbols
   - `<Space>/`: Global search
   - `<Space>k`: Show hover info
   - `<Space>a`: Code actions

#### Philosophy
- Normal Mode is primarily for selection
- Visual Mode is for actions
- Leverages existing Neovim and `mini.nvim` functionality
- Provides a Helix-like editing experience

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
