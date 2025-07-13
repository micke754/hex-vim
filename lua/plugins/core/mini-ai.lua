return {
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup({
				mappings = {
					around = "ma", -- Change 'a' to 'ma' for "around" text objects
					inside = "mi", -- Change 'i' to 'mi' for "inside" text objects
				},
			})
		end,
	},
}
