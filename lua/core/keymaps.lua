-- Core keymaps that are not plugin-specific

-- Normal movements
--e

-- Timer-based smart motion tracking
local last_motion_time = 0
local MOTION_TIMEOUT = 100 -- milliseconds (adjust as needed)

local function should_enter_visual_mode()
	local mode = vim.fn.mode()
	return mode == "n" and vim.v.operator == "" and vim.v.count == 0
end

local function create_smart_motion(motion)
	return function()
		local current_time = vim.loop.now()
		local current_mode = vim.fn.mode()

		if current_mode == "v" or current_mode == "V" then
			-- In visual mode
			if (current_time - last_motion_time) < MOTION_TIMEOUT then
				-- Within timeout - extend selection
				last_motion_time = current_time
				return motion
			else
				-- Timeout exceeded - new selection
				last_motion_time = current_time
				return "<Esc>v" .. motion
			end
		elseif should_enter_visual_mode() then
			-- Fresh movement from normal mode - enter visual mode
			last_motion_time = current_time
			return ":noh<CR>v" .. motion
		else
			-- Operator pending or count - stay normal (Vim style)
			return motion
		end
	end
end

local function smart_e()
	local current_time = vim.loop.now()
	local current_mode = vim.fn.mode()
	if current_mode == "v" or current_mode == "V" then
		if (current_time - last_motion_time) < MOTION_TIMEOUT then
			last_motion_time = current_time
			return "e"
		else
			last_motion_time = current_time
			return "<Esc>lve"
		end
	elseif should_enter_visual_mode() then
		last_motion_time = current_time
		return ":noh<CR>lve"
	else
		return "e"
	end
end

-- Word motions (Context-aware select-action)
local smart_w = create_smart_motion("w")
local smart_b = create_smart_motion("b")
local smart_W = create_smart_motion("W")
local smart_B = create_smart_motion("B")
local smart_E = create_smart_motion("E")
-- local smart_e = create_smart_motion("le")

vim.keymap.set({ "n", "v" }, "e", smart_e, { expr = true, noremap = true, desc = "smart e motion" })
vim.keymap.set({ "n", "v" }, "w", smart_w, { expr = true, noremap = true, desc = "smart w motion" })
vim.keymap.set({ "n", "v" }, "b", smart_b, { expr = true, noremap = true, desc = "smart b motion" })
vim.keymap.set({ "n", "v" }, "W", smart_W, { expr = true, noremap = true, desc = "smart W motion" })
vim.keymap.set({ "n", "v" }, "B", smart_B, { expr = true, noremap = true, desc = "smart B motion" })
vim.keymap.set({ "n", "v" }, "E", smart_E, { expr = true, noremap = true, desc = "smart E motion" })

-- Escape
-- vim.keymap.set("i", "jj", "<Esc>", { noremap = true, desc = "Select inside word" })

-- Existing text object selections
vim.keymap.set("n", "mip", "vip", { noremap = true, desc = "Select inside paragraph" })
vim.keymap.set("n", "miw", "viw", { noremap = true, desc = "Select inside word" })
-- vim.keymap.set("n", "mm", "%", { noremap = true, desc = "Select inside word" })

-- Buffer management
-- vim.keymap.set(
--     "n",
--     "<Space>wq",
--     ":lua require('mini.bufremove').delete(0, false)<CR>",
--     { noremap = true, desc = "Quit buffer" }
-- )

-- View Mode (Viewport Control)
vim.keymap.set("n", "zz", "zz", { noremap = true, desc = "Center cursor line" })
vim.keymap.set("n", "zt", "zt", { noremap = true, desc = "Cursor line to top" })
vim.keymap.set("n", "zb", "zb", { noremap = true, desc = "Cursor line to bottom" })
vim.keymap.set("n", "zh", "zh", { noremap = true, desc = "Scroll left" })
vim.keymap.set("n", "zl", "zl", { noremap = true, desc = "Scroll right" })

-- Movement improvements
vim.keymap.set({ "n", "v" }, "<C-d>", function()
	local mode = vim.fn.mode()
	if mode == "v" or mode == "V" then
		return "<Esc><C-d>zz"
	else
		return "<C-d>zz"
	end
end, { expr = true, noremap = true, desc = "Scroll down and center" })

vim.keymap.set({ "n", "v" }, "<C-u>", function()
	local mode = vim.fn.mode()
	if mode == "v" or mode == "V" then
		return "<Esc><C-u>zz"
	else
		return "<C-u>zz"
	end
end, { expr = true, noremap = true, desc = "Scroll up and center" })

-- Goto Mode (LSP and Navigation)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, desc = "Goto definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, desc = "Goto references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, desc = "Goto implementation" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { noremap = true, desc = "Goto type definition" })
vim.keymap.set("n", "gf", "<C-w>gf", { noremap = true, desc = "Goto file under cursor" })

-- Navigation Motions
vim.keymap.set("n", "ge", "G", { noremap = true, desc = "Goto end of document" })
vim.keymap.set("n", "gs", "0", { noremap = true, desc = "Goto start of line" })
vim.keymap.set("n", "gl", "$", { noremap = true, desc = "Goto end of line" })

-- Searching
vim.keymap.set("n", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })
vim.keymap.set("v", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })

vim.keymap.set("n", "s", "", { noremap = true, desc = "unmap s" })

-- Space Mode (Pickers)
vim.keymap.set("n", "<Space>f", "<cmd>Telescope find_files<cr>", { noremap = true, desc = "Find files" })
vim.keymap.set("n", "<Space>b", "<cmd>Telescope buffers<cr>", { noremap = true, desc = "Find buffers" })
vim.keymap.set(
	"n",
	"<Space>s",
	"<cmd>Telescope lsp_document_symbols<cr>",
	{ noremap = true, desc = "Document symbols" }
)

-- Preference
vim.keymap.set({ "n", "v" }, "<Space>qq", "<Esc>:qa<CR>", { noremap = true, desc = "Quit all buffers" })
vim.keymap.set({ "n", "v" }, "<Space>ww", "<Esc>:w<CR>", { noremap = true, desc = "Save buffer" })

-- Line operations removed

-- Support most common modes. This can also contain 't', but would
-- only mean to press `<Esc>` inside terminal.

-- Match/Surround Mode
-- Requires mini.surround plugin
local function safe_surround_add()
	local ok, mini_surround = pcall(require, "mini.surround")
	if ok then
		mini_surround.add("visual")
	else
		print("mini.surround not loaded")
	end
end

local function safe_surround_replace()
	local ok, mini_surround = pcall(require, "mini.surround")
	if ok then
		mini_surround.replace()
	else
		print("mini.surround not loaded")
	end
end

local function safe_surround_delete()
	local ok, mini_surround = pcall(require, "mini.surround")
	if ok then
		mini_surround.delete()
	else
		print("mini.surround not loaded")
	end
end

vim.keymap.set("n", "ms", safe_surround_add, { noremap = true, desc = "Surround selection" })
vim.keymap.set("n", "mr", safe_surround_replace, { noremap = true, desc = "Replace surround" })
vim.keymap.set("n", "md", safe_surround_delete, { noremap = true, desc = "Delete surround" })
