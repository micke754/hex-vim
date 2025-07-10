-- lua/core/keymaps.lua

local keymap = vim.keymap
local api = vim.api

-- Utility function to check if a keymap exists
local function keymap_exists(mode, lhs)
	return #api.nvim_get_keymap(mode) > 0 and api.nvim_get_keymap(mode)[lhs] ~= nil
end

-- ####################################################################
-- ## Normal Mode
-- ####################################################################

-- Most motions are prefixed with 'v' to enter visual mode and select.
-- This is the core of the "select-then-act" model.

-- Movement and Selection
keymap.set("n", "h", "vh", { noremap = true, desc = "Select left" })
keymap.set("n", "j", "vj", { noremap = true, desc = "Select down" })
keymap.set("n", "k", "vk", { noremap = true, desc = "Select up" })
keymap.set("n", "l", "vl", { noremap = true, desc = "Select right" })
keymap.set("n", "w", "viw", { noremap = true, desc = "Select word" })
keymap.set("n", "b", "vib", { noremap = true, desc = "Select word backward" })
keymap.set("n", "e", "vie", { noremap = true, desc = "Select to word end" })
keymap.set("n", "W", "viW", { noremap = true, desc = "Select WORD" })
keymap.set("n", "B", "viB", { noremap = true, desc = "Select WORD backward" })
keymap.set("n", "E", "viE", { noremap = true, desc = "Select to WORD end" })
keymap.set("n", "x", "v", { noremap = true, desc = "Select line" })
keymap.set("n", "X", "V", { noremap = true, desc = "Select lines" })
keymap.set("n", "%", "v%", { noremap = true, desc = "Select matching bracket" })

-- Changes (these will operate on selections made in visual mode)
keymap.set("v", "d", "d", { noremap = true, desc = "Delete selection" })
keymap.set("v", "c", "c", { noremap = true, desc = "Change selection" })
keymap.set("v", "y", "y", { noremap = true, desc = "Yank selection" })
keymap.set("v", "p", "p", { noremap = true, desc = "Paste after selection" })
keymap.set("v", "P", "P", { noremap = true, desc = "Paste before selection" })
keymap.set("v", ">", ">gv", { noremap = true, desc = "Indent selection" })
keymap.set("v", "<", "<gv", { noremap = true, desc = "Unindent selection" })

-- Insert Mode
keymap.set("n", "i", "i", { noremap = true, desc = "Insert before selection" })
keymap.set("n", "a", "a", { noremap = true, desc = "Append after selection" })
keymap.set("n", "I", "I", { noremap = true, desc = "Insert at start of line" })
keymap.set("n", "A", "A", { noremap = true, desc = "Append at end of line" })
keymap.set("n", "o", "o", { noremap = true, desc = "Open new line below" })
keymap.set("n", "O", "O", { noremap = true, desc = "Open new line above" })

-- ####################################################################
-- ## Goto Mode (g)
-- ####################################################################
-- These are non-selecting motions.
keymap.set("n", "gg", "gg", { noremap = true, desc = "Goto top of file" })
keymap.set("n", "ge", "G", { noremap = true, desc = "Goto end of file" })
keymap.set("n", "gs", "0", { noremap = true, desc = "Goto start of line" })
keymap.set("n", "gl", "$", { noremap = true, desc = "Goto end of line" })
keymap.set("n", "gd", "gd", { noremap = true, desc = "Goto definition" })
keymap.set("n", "gy", "gy", { noremap = true, desc = "Goto type definition" })
keymap.set("n", "gr", "gr", { noremap = true, desc = "Goto references" })
keymap.set("n", "gi", "gi", { noremap = true, desc = "Goto implementation" })

-- ####################################################################
-- ## Space Mode
-- ####################################################################
keymap.set("n", "<Space>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<Space>g", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<Space>b", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap.set("n", "<Space>h", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap.set("n", "<Space>k", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover documentation" })
keymap.set("n", "<Space>s", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
keymap.set("n", "<Space>S", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace symbols" })
keymap.set("n", "<Space>d", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
keymap.set("n", "<Space>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action" })
keymap.set("n", "<Space>w", "<cmd>w<cr>", { desc = "Write" })
keymap.set("n", "<Space>q", "<cmd>q<cr>", { desc = "Quit" })
keymap.set("n", "<Space>x", "<cmd>q!<cr>", { desc = "Force quit" })
keymap.set("n", "<Space>o", "<cmd>MiniFiles<cr>", { desc = "Open files" })

-- ####################################################################
-- ## Window Mode (Ctrl-w)
-- ####################################################################
keymap.set("n", "<C-w>v", "<C-w>v", { noremap = true, desc = "Vertical split" })
keymap.set("n", "<C-w>s", "<C-w>s", { noremap = true, desc = "Horizontal split" })
keymap.set("n", "<C-w>h", "<C-w>h", { noremap = true, desc = "Move to left split" })
keymap.set("n", "<C-w>j", "<C-w>j", { noremap = true, desc = "Move to below split" })
keymap.set("n", "<C-w>k", "<C-w>k", { noremap = true, desc = "Move to above split" })
keymap.set("n", "<C-w>l", "<C-w>l", { noremap = true, desc = "Move to right split" })
keymap.set("n", "<C-w>q", "<C-w>q", { noremap = true, desc = "Close split" })
keymap.set("n", "<C-w>o", "<C-w>o", { noremap = true, desc = "Close other splits" })

-- ####################################################################
-- ## Other
-- ####################################################################
-- Enter command mode
keymap.set("n", ":", ":", { noremap = true })

-- Exit visual mode
keymap.set("v", "v", "<Esc>", { noremap = true, desc = "Exit visual mode" })

-- Collapse selection
keymap.set("n", ";", "<Esc>", { noremap = true, desc = "Collapse selection" })

-- Collapse selection
keymap.set("v", ";", "<Esc>", { noremap = true, desc = "Collapse selection" })

-- Insert mode
keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode" })

-- Clear search highlighting
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
