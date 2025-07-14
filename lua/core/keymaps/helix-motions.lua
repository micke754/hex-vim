-- Helix-style motion emulation with smart selection

local M = {}

-- Timer-based smart motion tracking
local last_motion_time = 0
local MOTION_TIMEOUT = 100 -- milliseconds (adjust as needed)

local function should_enter_visual_mode()
	local mode = vim.fn.mode()
	return mode == "n" and vim.v.operator == "" and vim.v.count == 0
end

-- Smart motion generator with Helix-like behavior
local function create_smart_motion(motion, direction)
	return function()
		local current_time = vim.loop.now()
		local current_mode = vim.fn.mode()

		if current_mode == "v" or current_mode == "V" then
			if (current_time - last_motion_time) < MOTION_TIMEOUT then
				-- Within timeout - extend selection with direction-specific logic
				last_motion_time = current_time
				return direction .. "<Esc>v" .. motion
			else
				-- Timeout - new selection
				last_motion_time = current_time
				return direction .. "<Esc>v" .. motion
			end
		elseif should_enter_visual_mode() then
			-- Fresh movement from normal mode - enter visual mode
			last_motion_time = current_time
			return "<Esc>v" .. motion
		else
			-- Operator pending or count - stay normal (Vim style)
			return motion
		end
	end
end

-- Specific smart motions with direction
M.smart_e = create_smart_motion("e", "l") -- Forward, move right first
M.smart_w = create_smart_motion("w", "l") -- Forward word
M.smart_b = create_smart_motion("b", "h") -- Backward, move left first
M.smart_W = create_smart_motion("W", "l") -- Forward WORD
M.smart_B = create_smart_motion("B", "h") -- Backward WORD
M.smart_E = create_smart_motion("E", "l") -- End of WORD

-- Text object selections
M.select_inside_paragraph = function()
	return "vip"
end
M.select_inside_word = function()
	return "viw"
end

-- Setup function to register all keymaps
M.setup = function()
	vim.keymap.set({ "n", "v" }, "e", M.smart_e, { expr = true, noremap = true, desc = "Smart e motion" })
	vim.keymap.set({ "n", "v" }, "w", M.smart_w, { expr = true, noremap = true, desc = "Smart w motion" })
	vim.keymap.set({ "n", "v" }, "b", M.smart_b, { expr = true, noremap = true, desc = "Smart b motion" })
	vim.keymap.set({ "n", "v" }, "W", M.smart_W, { expr = true, noremap = true, desc = "Smart W motion" })
	vim.keymap.set({ "n", "v" }, "B", M.smart_B, { expr = true, noremap = true, desc = "Smart B motion" })
	vim.keymap.set({ "n", "v" }, "E", M.smart_E, { expr = true, noremap = true, desc = "Smart E motion" })

	-- Text object selections
	vim.keymap.set({ "n", "v" }, "mip", M.select_inside_paragraph, { noremap = true, desc = "Select inside paragraph" })
	vim.keymap.set({ "n", "v" }, "miw", M.select_inside_word, { noremap = true, desc = "Select inside word" })
end

return M
