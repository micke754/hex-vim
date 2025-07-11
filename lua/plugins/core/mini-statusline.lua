local enabled = true
local plugin = {
	"echasnovski/mini.statusline",
	config = function()
		require("mini.statusline").setup({
			use_icons = false,
		})
	end,
}

if enabled == true then
	return plugin
else
	return {}
end
