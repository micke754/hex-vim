return {
	"echasnovski/mini.animate",
	version = false, -- latest
	config = function()
		require("mini.animate").setup({
			-- Number of animation steps
			-- Default: 10
			steps = 10,

			-- Time (in ms) between animation steps
			-- Default: 30
			delay = 30,

			-- Animation type. Can be "linear", "expout", "sin", or a custom function
			-- Default: "linear"
			timing = "quadratic",

			-- Submodule for resizing windows
			resize = {
				enable = true,
				-- timing = "quadratic",
				steps = 60,
			},

			-- Submodule for scrolling
			scroll = {
				enable = true,
				-- timing = "expout",
				steps = 40,
			},

			-- Submodule for cursor movement
			cursor = {
				enable = true,
				-- timing = "linear",
				steps = 10,
			},

			-- Submodule for opening/closing windows
			close = {
				enable = true,
				-- timing = "linear",
				steps = 60,
			},

			-- Submodule for opening/closing windows
			open = {
				enable = true,
				-- timing = "linear",
				steps = 60,
			},
		})
	end,
}
