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

-- Preferences
vim.keymap.set({ "n", "v" }, "<Space>qq", "<Esc>:qa<CR>", { noremap = true, desc = "Quit all buffers" })
vim.keymap.set({ "n", "v" }, "<Space>ww", "<Esc>:w<CR>", { noremap = true, desc = "Save buffer" })

-- Text object selections
vim.keymap.set({ "n", "v" }, "mip", "vip", { noremap = true, desc = "Select inside paragraph" })
vim.keymap.set({ "n", "v" }, "miw", "viw", { noremap = true, desc = "Select inside word" })
vim.keymap.set({ "n", "v" }, "miW", "viW", { noremap = true, desc = "Select inside Word" })

--Nvim Dbee
vim.keymap.set({ "n", "v" }, "<Space>is", "<cmd>Dbee open<cr>", { noremap = true, desc = "Dbee Open" })
vim.keymap.set({ "n", "v" }, "<Space>ic", "<cmd>Dbee close<cr>", { noremap = true, desc = "Dbee Close" })
vim.keymap.set({ "n", "v" }, "<Space>td", "<cmd>Dbee toggle<cr>", { noremap = true, desc = "Dbee Toggle" })

--FineCmdline
vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

-- Global keymaps for running SQL in any .sql file
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sql",
	callback = function(args)
		local bufnr = args.buf

		-- Execute the visually selected query and toggle the Dbee UI
		vim.keymap.set("v", "<C-e>", function()
			-- 1. Yank the visual selection into a specific register (e.g., "q")
			--    Using a named register prevents overwriting the user's default yank.
			vim.cmd('noautocmd normal! "qy"')

			-- 2. Get the content from that register
			local query = vim.fn.getreg("q")

			-- 3. Execute the query, which also opens the UI
			if query and query ~= "" then
				require("dbee").execute(query)
			end
		end, { buffer = bufnr, desc = "DBee: Run Selection & Toggle UI" })

		-- Execute the entire file and toggle the Dbee UI (This part remains the same)
		vim.keymap.set("n", "<C-e>", function()
			local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
			local query = table.concat(lines, "\n")
			if query and query ~= "" then
				require("dbee").execute(query)
			end
		end, { buffer = bufnr, desc = "DBee: Run File & Toggle UI" })
	end,
})

-- Require Helix-style keymaps
require("core.keymaps.helix-keymaps").setup()
-- require("core.keymaps.helix-motions").setup()
