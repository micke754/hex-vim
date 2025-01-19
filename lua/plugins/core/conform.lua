return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python = { "ruff" },
					lua = { "stylua" },
				},
			})

			-- Format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					require("conform").format({ async = false })
				end,
			})
		end,
	},
}
