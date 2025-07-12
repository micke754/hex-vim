return {
	{
		"echasnovski/mini.basics",
		version = false,
		config = function()
			require("mini.basics").setup({
				options = {
					basic = true,
					extra_ui = false,
					win_borders = "single",
				},
				mappings = {
					basic = false,
					option_toggle_prefix = "",
					windows = false,
					move_with_alt = false,
				},
				autocommands = {
					basic = true,
					relnum_in_visual_mode = false,
				},
				silent = false,
			})

			vim.opt.showmode = false
			vim.opt.backup = false
			vim.opt.writebackup = false
			vim.opt.relativenumber = true
		end,
	},
}
