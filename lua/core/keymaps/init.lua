-- Core Neovim keymaps

-- Searching
vim.keymap.set({ "n", "v" }, ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })

-- Unmap s
-- local mode = { "n", "x", "s" }
-- vim.keymap.set(mode, "s", "", { noremap = true, desc = "unmap s" })

-- Space Mode (Pickers)
vim.keymap.set("n", "<Space>f", "<cmd>Telescope find_files<cr>", { noremap = true, desc = "Find files" })
vim.keymap.set("n", "<Space>b", "<cmd>Telescope buffers<cr>", { noremap = true, desc = "Find buffers" })
vim.keymap.set(
	"n",
	"<Space>s",
	"<cmd>Telescope lsp_document_symbols<cr>",
	{ noremap = true, desc = "Document symbols" }
)

--Nvim Dbee
vim.keymap.set("n", "<Space>is", "<cmd>Dbee open<cr>", { noremap = true, desc = "Dbee Open" })
vim.keymap.set("n", "<Space>ic", "<cmd>Dbee close<cr>", { noremap = true, desc = "Dbee Close" })
vim.keymap.set("n", "<Space>it", "<cmd>Dbee toggle<cr>", { noremap = true, desc = "Dbee Toggle" })

-- Preferences
vim.keymap.set({ "n", "v" }, "<Space>qq", "<Esc>:qa<CR>", { noremap = true, desc = "Quit all buffers" })
vim.keymap.set({ "n", "v" }, "<Space>ww", "<Esc>:w<CR>", { noremap = true, desc = "Save buffer" })

-- Text object selections
vim.keymap.set({ "n", "v" }, "mip", "vip", { noremap = true, desc = "Select inside paragraph" })
vim.keymap.set({ "n", "v" }, "miw", "viw", { noremap = true, desc = "Select inside word" })
vim.keymap.set({ "n", "v" }, "miW", "viW", { noremap = true, desc = "Select inside Word" })

-- Global keymaps for running SQL in any .sql file
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sql",
	callback = function(args)
		local bufnr = args.buf

		-- Execute the visually selected query and toggle the Dbee UI
		vim.keymap.set("v", "<C-e>", function()
			-- The require("dbee.utils") part is not public API, so it's safer
			-- to get the selection range manually.
			local start_pos = vim.fn.getpos("'<")
			local end_pos = vim.fn.getpos("'>")
			local lines = vim.api.nvim_buf_get_lines(bufnr, start_pos[2] - 1, end_pos[2], false)

			-- Trim the selection to the exact columns
			if #lines == 1 then
				lines[1] = lines[1]:sub(start_pos[3], end_pos[3])
			else
				lines[1] = lines[1]:sub(start_pos[3])
				lines[#lines] = lines[#lines]:sub(1, end_pos[3])
			end

			local query = table.concat(lines, "\n")
			require("dbee").execute(query)
		end, { buffer = bufnr, desc = "DBee: Run Selection & Toggle UI" })

		-- Execute the entire file and toggle the Dbee UI
		vim.keymap.set("n", "<C-e>", function()
			local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
			local query = table.concat(lines, "\n")
			require("dbee").execute(query)
		end, { buffer = bufnr, desc = "DBee: Run File & Toggle UI" })
	end,
})
-- Require Helix-style keymaps
require("core.keymaps.helix-keymaps").setup()
-- require("core.keymaps.helix-motions").setup()
