-- Theme selection - change this variable to switch themes
local THEME = "rose-pine" -- Options: "catppuccin", "rose-pine", "oxocarbon", "kanagawa-dark"

-- Theme palettes
local themes = {
	catppuccin = {
		base00 = "#1e1e2e", -- Default Background
		base01 = "#181825", -- Lighter Background (Used for status bars, line number and folding marks)
		base02 = "#45475a", -- Selection Background (Lightened for better visibility)
		base03 = "#45475a", -- Comments, Invisibles, Line Highlighting
		base04 = "#585b70", -- Dark Foreground (Used for status bars)
		base05 = "#cdd6f4", -- Default Foreground, Caret, Delimiters, Operators
		base06 = "#f5e0dc", -- Light Foreground (Not often used)
		base07 = "#b4befe", -- Light Background (Not often used)
		base08 = "#f38ba8", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
		base09 = "#fab387", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
		base0A = "#f9e2af", -- Classes, Markup Bold, Search Text Background
		base0B = "#a6e3a1", -- Strings, Inherited Class, Markup Code, Diff Inserted
		base0C = "#94e2d5", -- Support, Regular Expressions, Escape Characters, Markup Quotes
		base0D = "#89b4fa", -- Functions, Methods, Attribute IDs, Headings
		base0E = "#cba6f7", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
		base0F = "#f2cdcd", -- Deprecated, Opening/Closing Embedded Language Tags
	},

	["rose-pine"] = {
		base00 = "#191724", -- Default Background
		base01 = "#1f1d2e", -- Lighter Background
		base02 = "#403d52", -- Selection Background (Lightened for better visibility)
		base03 = "#6e6a86", -- Comments, Invisibles
		base04 = "#908caa", -- Dark Foreground
		base05 = "#e0def4", -- Default Foreground
		base06 = "#f6f4ed", -- Light Foreground
		base07 = "#56526e", -- Light Background
		base08 = "#eb6f92", -- Variables, Tags
		base09 = "#f6c177", -- Integers, Boolean, Constants
		base0A = "#ebbcba", -- Classes, Search Text Background
		base0B = "#31748f", -- Strings, Inherited Class
		base0C = "#9ccfd8", -- Support, Regular Expressions
		base0D = "#c4a7e7", -- Functions, Methods, Headings
		base0E = "#f6c177", -- Keywords, Storage, Selector
		base0F = "#524f67", -- Deprecated, Embedded Language Tags
	},

	oxocarbon = {
		-- base00 = "#161616", -- Default Background
		-- base01 = "#262626", -- Lighter Background
		-- base02 = "#393939", -- Selection Background
		-- base03 = "#525252", -- Comments, Invisibles
		-- base04 = "#6f6f6f", -- Dark Foreground
		-- base05 = "#ffffff", -- Default Foreground
		-- base06 = "#f2f2f2", -- Light Foreground
		-- base07 = "#08bdba", -- Light Background / Accent
		-- base08 = "#3ddbd9", -- Variables, Tags
		-- base09 = "#ff7eb6", -- Integers, Boolean, Constants
		-- base0A = "#42be65", -- Classes, Search Text Background
		-- base0B = "#ee5396", -- Strings, Inherited Class
		-- base0C = "#82cfff", -- Support, Regular Expressions
		-- base0D = "#33b1ff", -- Functions, Methods, Headings
		-- base0E = "#ff7eb6", -- Keywords, Storage, Selector
		-- base0F = "#be95ff", -- Deprecated, Embedded Language Tags
		base00 = "#161616",
		base01 = "#1f1d2e",
		base02 = "#393939",
		base03 = "#525252",
		base04 = "#dde1e6",
		base05 = "#f2f4f8",
		base06 = "#ffffff",
		base07 = "#08bdba",
		base08 = "#3ddbd9",
		base09 = "#78a9ff",
		base0A = "#ee5396",
		base0B = "#33b1ff",
		base0C = "#ff7eb6",
		base0D = "#42be65",
		base0E = "#be95ff",
		base0F = "#82cfff",
	},

	["kanagawa-dark"] = {
		base00 = "#1f1f28", -- Default Background
		base01 = "#2a2a37", -- Lighter Background
		base02 = "#363646", -- Selection Background
		base03 = "#54546d", -- Comments, Invisibles
		base04 = "#6a6a82", -- Dark Foreground
		base05 = "#dcd7ba", -- Default Foreground
		base06 = "#c8c093", -- Light Foreground
		base07 = "#717c7c", -- Light Background
		base08 = "#c4746e", -- Variables, Tags
		base09 = "#ffa066", -- Integers, Boolean, Constants
		base0A = "#c4746e", -- Classes, Search Text Background
		base0B = "#76946a", -- Strings, Inherited Class
		base0C = "#6a9589", -- Support, Regular Expressions
		base0D = "#7e9cd8", -- Functions, Methods, Headings
		base0E = "#957fb8", -- Keywords, Storage, Selector
		base0F = "#d27e99", -- Deprecated, Embedded Language Tags
	},
}

return {
	{
		"echasnovski/mini.base16",
		version = false,
		config = function()
			require("mini.base16").setup({
				palette = themes[THEME],
				use_cterm = true,
				plugins = {
					default = true,
				},
			})
		end,
	},
}
