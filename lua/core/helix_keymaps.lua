-- lua/core/helix_keymaps.lua

local keymap = vim.keymap

-- Normal Mode
keymap.set("n", "<Space>", "", { noremap = true, silent = true })

-- Navigation
keymap.set("n", "h", "h", { noremap = true })
keymap.set("n", "j", "j", { noremap = true })
keymap.set("n", "k", "k", { noremap = true })
keymap.set("n", "l", "l", { noremap = true })
keymap.set("n", "w", "w", { noremap = true })
keymap.set("n", "b", "b", { noremap = true })
keymap.set("n", "e", "e", { noremap = true })
keymap.set("n", "ge", "ge", { noremap = true })
keymap.set("n", "gg", "gg", { noremap = true })
keymap.set("n", "G", "G", { noremap = true })
keymap.set("n", "%", "%", { noremap = true })

-- Editing
keymap.set("n", "d", "d", { noremap = true })
keymap.set("n", "c", "c", { noremap = true })
keymap.set("n", "y", "y", { noremap = true })
keymap.set("n", "p", "p", { noremap = true })
keymap.set("n", "P", "P", { noremap = true })
keymap.set("n", "x", "x", { noremap = true })
keymap.set("n", "X", "X", { noremap = true })
keymap.set("n", ".", ".", { noremap = true })
keymap.set("n", "u", "u", { noremap = true })
keymap.set("n", "<C-r>", "<C-r>", { noremap = true })

-- Visual Mode
keymap.set("v", "d", "d", { noremap = true })
keymap.set("v", "c", "c", { noremap = true })
keymap.set("v", "y", "y", { noremap = true })
keymap.set("v", "p", "p", { noremap = true })
keymap.set("v", "P", "P", { noremap = true })

-- Command Mode
keymap.set("n", ":", ":", { noremap = true })

-- Search
keymap.set("n", "/", "/", { noremap = true })
keymap.set("n", "?", "?", { noremap = true })
keymap.set("n", "n", "n", { noremap = true })
keymap.set("n", "N", "N", { noremap = true })

-- Space Leader
keymap.set("n", "<Space>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<Space>g", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<Space>b", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap.set("n", "<Space>h", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap.set("n", "<Space>s", ":", { desc = "Command" })
keymap.set("n", "<Space>w", "<cmd>w<cr>", { desc = "Write" })
keymap.set("n", "<Space>q", "<cmd>q<cr>", { desc = "Quit" })
keymap.set("n", "<Space>x", "<cmd>q!<cr>", { desc = "Force quit" })

-- Goto
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto definition" })
keymap.set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Goto type definition" })
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Goto implementation" })
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Goto references" })

-- Diagnostics
keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })
keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
keymap.set("n", "<Space>d", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Line diagnostics" })
