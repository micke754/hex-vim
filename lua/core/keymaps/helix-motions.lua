-- Helix-style motion emulation with smart selection

local helix_motions_enabled = true

local function toggle_helix_motions()
	helix_motions_enabled = not helix_motions_enabled
	vim.notify("Helix motions: " .. (helix_motions_enabled and "enabled" or "disabled"))
	M.setup(helix_motions_enabled)
end

-- State variable to track if last command was a visual motion extension
local last_was_visual_motion = false

local function is_normal_mode_no_operator()
	local mode = vim.fn.mode()
	return mode == "n" and vim.v.operator == "" and vim.v.count == 0
end

local function is_visual_mode()
	local mode = vim.fn.mode()
	return mode == "v" or mode == "V"
end

local function is_operator_pending()
	return vim.v.operator ~= ""
end

-- Smart motion generator with Helix-like behavior
local function create_smart_motion(motion, direction)
	return function()
		local mode = vim.fn.mode()
		if mode == "n" and vim.v.operator == "" then
			return "<Esc>v" .. motion
		elseif mode == "v" or mode == "V" then
			return direction .. "<Esc>v" .. motion
		elseif vim.v.operator ~= "" then
			return motion
		else
			return motion
		end

		vim.keymap.set({ "n", "v" }, "<Space>\\", toggle_helix_motions, { desc = "Toggle Helix motions" })
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
-- M.select_inside_paragraph = function()
-- 	return "<Esc>vip"
-- end
-- M.select_inside_word = function()
-- 	return "<Esc>viw"
-- end

-- Setup function to register all keymaps
M.setup = function(enable_helix_motions)
	local helix_motions_enabled = enable_helix_motions

	local function toggle_helix_motions()
		helix_motions_enabled = not helix_motions_enabled
		vim.notify("Helix motions: " .. (helix_motions_enabled and "enabled" or "disabled"))
		M.setup(helix_motions_enabled)
	end

	vim.keymap.set({ "n", "v" }, "<Space>\\", toggle_helix_motions, { desc = "Toggle Helix motions" })

	if enable_helix_motions then
		vim.keymap.set({ "n", "v" }, "e", M.smart_e, { expr = true, noremap = true, desc = "Smart e motion" })
		vim.keymap.set({ "n", "v" }, "w", M.smart_w, { expr = true, noremap = true, desc = "Smart w motion" })
		vim.keymap.set({ "n", "v" }, "b", M.smart_b, { expr = true, noremap = true, desc = "Smart b motion" })
		vim.keymap.set({ "n", "v" }, "W", M.smart_W, { expr = true, noremap = true, desc = "Smart W motion" })
		vim.keymap.set({ "n", "v" }, "B", M.smart_B, { expr = true, noremap = true, desc = "Smart B motion" })
		vim.keymap.set({ "n", "v" }, "E", M.smart_E, { expr = true, noremap = true, desc = "Smart E motion" })

		-- Text object selections
		-- vim.keymap.set({ "n", "v" }, "mip", M.select_inside_paragraph, { noremap = true, desc = "Select inside paragraph" })
		-- vim.keymap.set({ "n", "v" }, "miw", M.select_inside_word, { noremap = true, desc = "Select inside word" })
	end
end

return M
