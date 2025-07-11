-- Core Neovim keymaps

-- Searching
-- vim.keymap.set("n", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })
-- vim.keymap.set("v", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })

-- Unmap s
vim.keymap.set("n", "s", "", { noremap = true, desc = "unmap s" })

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

-- Require Helix-style keymaps
require("core.helix-motions").setup()
require("core.helix-keymaps").setup()
