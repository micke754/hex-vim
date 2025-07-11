-- Core keymaps that are not plugin-specific

-- Normal movements
--e

local function should_enter_visual_mode()
    local mode = vim.fn.mode()
    return mode == "n" and vim.v.operator == "" and vim.v.count == 0
end

local function create_smart_motion(motion)
    return function()
        local current_mode = vim.fn.mode()
        
        if current_mode == "v" or current_mode == "V" then
            -- Already in visual, just extend
            return motion
        elseif should_enter_visual_mode() then
            -- Fresh movement - enter visual mode (Helix style)
            return ":noh<CR>v" .. motion
        else
            -- Operator pending or count - stay normal (Vim style)
            return motion
        end
    end
end

local function smart_e()
    local current_mode = vim.fn.mode()
    
    if current_mode == "v" or current_mode == "V" then
        return "e"
    elseif should_enter_visual_mode() then
        return ":noh<CR>ve"
    else
        return "e"
    end
end

vim.keymap.set({ "n", "v" }, "e", smart_e, { expr = true, noremap = true, desc = "smart e motion" })

-- Word motions (Context-aware select-action)
local smart_w = create_smart_motion("w")
local smart_b = create_smart_motion("b")
local smart_W = create_smart_motion("W")
local smart_B = create_smart_motion("B")
local smart_E = create_smart_motion("E")

vim.keymap.set({ "n", "v" }, "w", smart_w, { expr = true, noremap = true, desc = "smart w motion" })
vim.keymap.set({ "n", "v" }, "b", smart_b, { expr = true, noremap = true, desc = "smart b motion" })
vim.keymap.set({ "n", "v" }, "W", smart_W, { expr = true, noremap = true, desc = "smart W motion" })
vim.keymap.set({ "n", "v" }, "B", smart_B, { expr = true, noremap = true, desc = "smart B motion" })
vim.keymap.set({ "n", "v" }, "E", smart_E, { expr = true, noremap = true, desc = "smart E motion" })

-- Visual selections
vim.keymap.set("n", "mip", "vip", { noremap = true, desc = "Select in paragraph (Helix-style)" })
vim.keymap.set("n", "miw", "viw", { noremap = true, desc = "Select in word (Helix-style)" })

-- Buffer management
-- vim.keymap.set(
--     "n",
--     "<Space>wq",
--     ":lua require('mini.bufremove').delete(0, false)<CR>",
--     { noremap = true, desc = "Quit buffer" }
-- )

-- Movement improvements
vim.keymap.set({ "n", "v" }, "<C-d>", function()
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" then
        return "<Esc><C-d>zz"
    else
        return "<C-d>zz"
    end
end, { expr = true, noremap = true, desc = "Scroll down and center" })

vim.keymap.set({ "n", "v" }, "<C-u>", function()
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" then
        return "<Esc><C-u>zz"
    else
        return "<C-u>zz"
    end
end, { expr = true, noremap = true, desc = "Scroll up and center" })

vim.keymap.set("n", "ge", "G", { noremap = true, desc = "Scroll to end" })
vim.keymap.set("n", "gs", "0", { noremap = true, desc = "Scroll to start" })
vim.keymap.set("n", "gl", "$", { noremap = true, desc = "Scroll to end of line" })

-- Searching
vim.keymap.set("n", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })
vim.keymap.set("v", ";", ":noh<CR>", { noremap = true, desc = "Clear search highlighting" })

vim.keymap.set("n", "s", "", { noremap = true, desc = "unmap s" })

-- Preference
vim.keymap.set({ "n", "v" }, "<Space>qq", "<Esc>:qa<CR>", { noremap = true, desc = "Quit all buffers" })
vim.keymap.set({ "n", "v" }, "<Space>ww", "<Esc>:w<CR>", { noremap = true, desc = "Save buffer" })

local map_multistep = require("mini.keymap").map_multistep
-- Create a test mapping
-- map_multistep("n", "e", { "Esc", "v", "e" })
map_multistep("i", "<Tab>", { "pmenu_next" })
map_multistep("i", "<Tab>", { "pmenu_next" })
map_multistep("i", "<S-Tab>", { "pmenu_prev" })
map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
map_multistep("i", "<BS>", { "minipairs_bs" })

local map_combo = require("mini.keymap").map_combo

-- Support most common modes. This can also contain 't', but would
-- only mean to press `<Esc>` inside terminal.
local mode = { "i", "c", "x", "s" }
map_combo(mode, "jj", "<BS><BS><Esc>")

local mode = { "n", "v" }
map_combo(mode, "mm", "%")
