return {
	-- Treesitter for syntax highlighting and motions
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				incremental_selection = { enable = true },
				ensure_installed = {
					"c",
					"python",
					"go",
					"lua",
					"vim",
					"vimdoc",
					"sql",
				},
			})
		end,
	},
}
