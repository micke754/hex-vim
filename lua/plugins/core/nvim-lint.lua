return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				-- Example: enable 'luacheck' for Lua files
				lua = { "luacheck" },
				python = { "ruff" },
				sql = { "sqlfluff" },
				-- Add other filetypes and linters here
			}
		end,
	},
}
