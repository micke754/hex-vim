return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("dbee").setup({
			connections = {
				{
					name = "databricks",
					driver = "databricks",
					host = os.getenv("DATABRICKS_HOST"),
					http_path = os.getenv("DATABRICKS_HTTP_PATH"),
					token = os.getenv("DATABRICKS_TOKEN"),
				},
			},
		})
	end,
}
