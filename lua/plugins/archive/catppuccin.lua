local enabled = false
local plugin = {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					cmp = true,
					mini = true,
					treesitter = true,
				},
			})
		end,
	},
}

if enabled == false then
	return {}
else
	return plugin
end
