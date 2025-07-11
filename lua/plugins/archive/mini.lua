local enabled = false

local plugin = {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- require("mini.basics").setup({}) -- Basic settings
		-- require("mini.move").setup({}) -- Move text/blocks
		-- require("mini.ai").setup({}) -- Enhanced text objects
		-- require("mini.surround").setup({}) -- Surround management
		-- require("mini.comment").setup({}) -- Commenting
		-- require("mini.files").setup({}) -- File tree
		-- require("mini.starter").setup({}) -- Starting screen
		-- require("mini.completion").setup({}) -- Completion
		-- require("mini.align").setup({}) -- Alignment
		-- require("mini.bufremove").setup({}) -- Buffer removal
		-- require("mini.indentscope").setup({}) -- Indent scope visualization
	end,
}

if enabled == false then
	return {}
else
	return plugin
end
