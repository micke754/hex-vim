-- Core keymaps that are not plugin-specific

-- Normal movements
--e

local function create_helix_motion(motion)
	return function()
		if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
			return "<Esc>v" .. motion
		else
			return ":noh<CR>v" .. motion
		end
	end
end

local function helix_e()
	if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
		return "<Esc>ve"
	else
		return ":noh<CR>ve"
	end
end

vim.keymap.set({ "n", "v" }, "e", helix_e, { expr = true, noremap = true, desc = "helix e normal" })

-- Word motions (Helix-style select-action)
local helix_w = create_helix_motion("w")
local helix_b = create_helix_motion("b")
local helix_W = create_helix_motion("W")
local helix_B = create_helix_motion("B")
local helix_E = create_helix_motion("E")

vim.keymap.set({ "n", "v" }, "w", helix_w, { expr = true, noremap = true, desc = "helix w" })
vim.keymap.set({ "n", "v" }, "b", helix_b, { expr = true, noremap = true, desc = "helix b" })
vim.keymap.set({ "n", "v" }, "W", helix_W, { expr = true, noremap = true, desc = "helix W" })
vim.keymap.set({ "n", "v" }, "B", helix_B, { expr = true, noremap = true, desc = "helix B" })
vim.keymap.set({ "n", "v" }, "E", helix_E, { expr = true, noremap = true, desc = "helix E" })

-- Visual selections
vim.keymap.set("n", "mip", "vip", { noremap = true, desc = "Select in paragraph (Helix-style)" })
vim.keymap.set("n", "miw", "viw", { noremap = true, desc = "Select in word (Helix-style)" })

-- Buffer management
-- vim.keymap.set(
--     "n",
--     "<Space>wq",
--     ":lua require('mini.bufremove').delete(0, false)<CR>",
--     { noremap = true, desc = "Quit buffer" }
-- )

-- Movement improvements
vim.keymap.set({ "n", "v" }, "<C-d>", "<Esc><C-d>zz", { noremap = true, desc = "Scroll down and center" })
vim.keymap.set({ "n", "v" }, "<C-u>", "<Esc><C-u>zz", { noremap = true, desc = "Scroll up and center" })

vim.keymap.set("n", "ge", "G", { noremap = true, desc = "Scroll to end" })
vim.keymap.set("n", "gs", "0", { noremap = true, desc = "Scroll to start" })
vim.keymap.set("n", "gl", "$", { noremap = true, desc = "Scroll to end of line" })

-- Searching
vim.keymap.set("n", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })
vim.keymap.set("v", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })

vim.keymap.set("n", "s", "", { noremap = true, desc = "unmap s" })

-- Preference
vim.keymap.set({ "n", "v" }, "<Space>qq", "<Esc>:qa<CR>", { noremap = true, desc = "Quit all buffers" })
vim.keymap.set({ "n", "v" }, "<Space>ww", "<Esc>:w<CR>", { noremap = true, desc = "Save buffer" })

local map_multistep = require("mini.keymap").map_multistep
-- Create a test mapping
-- map_multistep("n", "e", { "Esc", "v", "e" })
map_multistep("i", "<Tab>", { "pmenu_next" })
map_multistep("i", "<Tab>", { "pmenu_next" })
map_multistep("i", "<S-Tab>", { "pmenu_prev" })
map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
map_multistep("i", "<BS>", { "minipairs_bs" })

local map_combo = require("mini.keymap").map_combo

-- Support most common modes. This can also contain 't', but would
-- only mean to press `<Esc>` inside terminal.
local mode = { "i", "c", "x", "s" }
map_combo(mode, "jj", "<BS><BS><Esc>")

local mode = { "n", "v" }
map_combo(mode, "mm", "%")
