-- lua/core/keymaps.lua

local keymap = vim.keymap

-- Escape insert
keymap.set("i", "jj", "<Esc>", { noremap = true, desc = "Enter visual mode" })

-- Escape visual
keymap.set("v", ";", "<Esc>", { noremap = true, desc = "Enter visual mode" })

-- Enter visual mode
keymap.set("n", "v", "v", { noremap = true, desc = "Enter visual mode" })

-- Exit visual mode
keymap.set("v", "v", "<Esc>", { noremap = true, desc = "Exit visual mode" })

-- Select word w
keymap.set("n", "w", "wviw", { noremap = true, desc = "Select word w" })

-- Select word e
keymap.set("n", "e", "eviw", { noremap = true, desc = "Select word e" })

-- Select word b
keymap.set("n", "b", "bviw", { noremap = true, desc = "Select word e" })

-- Extend selection to the right
-- keymap.set("n", "l", "vl", { noremap = true, desc = "Extend selection right" })

-- Extend selection to the left
-- keymap.set("n", "h", "vh", { noremap = true, desc = "Extend selection left" })

-- Select in paragraph
keymap.set("n", "p", "vip", { noremap = true, desc = "Select in paragraph" })

-- Space leader
keymap.set("n", "<Space>", "", { noremap = true, silent = true })
keymap.set("n", "<Space>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<Space>g", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<Space>b", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap.set("n", "<Space>h", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap.set("n", "<Space>s", ":", { desc = "Command" })
keymap.set("n", "<Space>w", "<cmd>w<cr>", { desc = "Write" })
keymap.set("n", "<Space>q", "<cmd>q<cr>", { desc = "Quit" })
keymap.set("n", "<Space>x", "<cmd>q!<cr>", { desc = "Force quit" })
keymap.set("n", "<Space>o", "<cmd>MiniFiles<cr>", { desc = "Open files" })

-- Goto
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto definition" })
keymap.set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Goto type definition" })
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Goto implementation" })
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Goto references" })

-- Diagnostics
keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })
keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
keymap.set("n", "<Space>d", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Line diagnostics" })
