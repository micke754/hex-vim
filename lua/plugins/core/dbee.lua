return {
	"kndndrj/nvim-dbee",
	dependencies = { "MunifTanjim/nui.nvim" },
	-- This is the critical change
	build = function()
		require("dbee").install("cgo")
	end,
	event = "VimEnter",
	config = function()
		-- Keep this simple, we are using persistence.json
		require("dbee").setup({
			editor = {
				mappings = {
					-- Pressing "<C-e>" in Visual mode runs the selected query
					{ key = "<C-e>", mode = "v", action = "run_selection" },
					-- Pressing "<C-e>" in Normal mode runs the entire note file
					{ key = "<C-e>", mode = "n", action = "run_file" },
					-- (Default) Pressing <CR> in Normal mode runs the statement under the cursor
					{ key = "<C-CR>", mode = "n", action = "run_under_cursor" },
					-- Pressing "<C-e>" in Visual mode runs the selected query
					{ key = "<C-e>", mode = "v", action = "run_selection" },
					-- Pressing "<C-e>" in Normal mode runs the entire note file
					{ key = "<C-e>", mode = "n", action = "run_file" },
					-- (Default) Pressing <CR> in Normal mode runs the statement under the cursor
					{ key = "<C-CR>", mode = "n", action = "run_under_cursor" },
				},
			},
		})
	end,
}
