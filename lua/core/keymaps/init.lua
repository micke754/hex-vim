-- Core Neovim keymaps

-- Searching
vim.keymap.set("n", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })
vim.keymap.set("v", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })

-- Unmap s
local mode = { "n", "x", "s" }
vim.keymap.set(mode, "s", "", { noremap = true, desc = "unmap s" })

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

-- Require Helix-style keymaps
require("core.keymaps.helix-keymaps").setup()
-- require("core.keymaps.helix-motions").setup()
