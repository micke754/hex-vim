-- Helix-style standard keymaps

local M = {}

local modes_nv = { "n", "v" }

-- Yank, Paste, and Replace keymaps to emulate Helix register behavior

local function setup_yank_paste_replace_keymaps()
	-- In our Helix-emulated normal mode, 'y' becomes a direct action.
	-- It no longer waits for a motion.
	vim.keymap.set("n", "y", "yiw", { noremap = true, desc = "Yank inner word" })

	-- Yank to system clipboard (Visual Mode). This is for explicit selections.
	vim.keymap.set("v", "<Space>y", '"+y', { noremap = true, desc = "Yank selection to system clipboard" })

	-- Yank to system clipboard (Normal Mode). This is a direct action, consistent with 'y'.
	-- We specify the motion 'iw' to make it a complete command.
	vim.keymap.set("n", "<Space>y", '"+yiw', { noremap = true, desc = "Yank word to system clipboard" })

	-- Paste from system clipboard (Normal Mode)
	vim.keymap.set("n", "<Space>p", '"+p', { noremap = true, desc = "Paste from system clipboard (after)" })
	vim.keymap.set("n", "<Space>P", '"+P', { noremap = true, desc = "Paste from system clipboard (before)" })

	-- Replace selection with default register (Visual Mode).
	-- The black hole register `_` is key to not overwriting our yanked text.
	vim.keymap.set("v", "R", '"_dP', { noremap = true, desc = "Replace selection with default register" })

	-- Replace inner word with default register (Normal Mode).
	-- This is a direct action, consistent with our other normal-mode overrides.
	vim.keymap.set("n", "R", '"_diwP', { noremap = true, desc = "Replace inner word with default register" })
end

-- View Mode (Viewport Control)
local function setup_view_mode_keymaps()
	vim.keymap.set(modes_nv, "zz", "zz", { noremap = true, desc = "Center cursor line" })
	vim.keymap.set(modes_nv, "zt", "zt", { noremap = true, desc = "Cursor line to top" })
	vim.keymap.set(modes_nv, "zb", "zb", { noremap = true, desc = "Cursor line to bottom" })
	vim.keymap.set(modes_nv, "zh", "z10h", { noremap = true, desc = "Scroll left" })
	vim.keymap.set(modes_nv, "zl", "z10l", { noremap = true, desc = "Scroll right" })
end

-- Movement Improvements
local function setup_movement_keymaps()
	vim.keymap.set(modes_nv, "<C-d>", function()
		local mode = vim.fn.mode()
		if mode == "v" or mode == "V" then
			return "<Esc><C-d>zz"
		else
			return "<C-d>zz"
		end
	end, { expr = true, noremap = true, desc = "Scroll down and center" })

	vim.keymap.set(modes_nv, "<C-u>", function()
		local mode = vim.fn.mode()
		if mode == "v" or mode == "V" then
			return "<Esc><C-u>zz"
		else
			return "<C-u>zz"
		end
	end, { expr = true, noremap = true, desc = "Scroll up and center" })
end

-- LSP and Navigation
local function setup_lsp_keymaps()
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, desc = "Goto definition" })
	vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, desc = "Goto references" })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, desc = "Goto implementation" })
	vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { noremap = true, desc = "Goto type definition" })
	vim.keymap.set("n", "gf", "<C-w>gf", { noremap = true, desc = "Goto file under cursor" })
end

-- Navigation Motions
local function setup_navigation_motions()
	vim.keymap.set(modes_nv, "ge", "G", { noremap = true, desc = "Goto end of document" })
	vim.keymap.set(modes_nv, "gs", "0", { noremap = true, desc = "Goto start of line" })
	vim.keymap.set(modes_nv, "gl", "$", { noremap = true, desc = "Goto end of line" })
	-- not navigation but related
	vim.keymap.set({ "n", "v" }, "%", "ggVG", { noremap = true, desc = "Select entire buffer" })
end

-- Setup all Helix-style keymaps
local function setup_undo_redo_keymaps()
	vim.keymap.set(modes_nv, "u", vim.cmd.undo, { desc = "Undo" })
	vim.keymap.set(modes_nv, "U", vim.cmd.redo, { desc = "Redo" })
end

M.setup = function()
	setup_lsp_keymaps()
	setup_movement_keymaps()
	setup_navigation_motions()
	setup_undo_redo_keymaps()
	setup_view_mode_keymaps()
	setup_yank_paste_replace_keymaps()
end

return M
