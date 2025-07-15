return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Pyright for Python
			lspconfig.basedpyright.setup({})

			-- Ruff for linting and diagnostics
			lspconfig.ruff.setup({
				settings = {
					args = { "--fix", "--quiet" }, -- Customize arguments if needed
				},
			})

			lspconfig.sqls.setup({
				settings = {
					connections = {
						{
							alias = "databricks",
							driver = "jdbc",
							dataSourceName = "jdbc:databricks://adb-1659029816912061.1.azuredatabricks.net:443/default;transportMode=http;ssl=1;AuthMech=3;httpPath=/sql/1.0/warehouses/2ce9027449545384;",
						},
					},
				},
			})

			-- Lua Language Server
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})
		end,
	},
}
