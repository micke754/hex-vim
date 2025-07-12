-- Helix-style standard keymaps

local M = {}

-- View Mode (Viewport Control)
local function setup_view_mode_keymaps()
    vim.keymap.set("n", "zz", "zz", { noremap = true, desc = "Center cursor line" })
    vim.keymap.set("n", "zt", "zt", { noremap = true, desc = "Cursor line to top" })
    vim.keymap.set("n", "zb", "zb", { noremap = true, desc = "Cursor line to bottom" })
    vim.keymap.set("n", "zh", "zh", { noremap = true, desc = "Scroll left" })
    vim.keymap.set("n", "zl", "zl", { noremap = true, desc = "Scroll right" })
end

-- Movement Improvements
local function setup_movement_keymaps()
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
end

-- LSP and Navigation
local function setup_lsp_keymaps()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, desc = "Goto definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, desc = "Goto references" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, desc = "Goto implementation" })
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { noremap = true, desc = "Goto type definition" })
    vim.keymap.set("n", "gf", "<C-w>gf", { noremap = true, desc = "Goto file under cursor" })
end

-- Navigation Motions
local function setup_navigation_motions()
    vim.keymap.set("n", "ge", "G", { noremap = true, desc = "Goto end of document" })
    vim.keymap.set("n", "gs", "0", { noremap = true, desc = "Goto start of line" })
    vim.keymap.set("n", "gl", "$", { noremap = true, desc = "Goto end of line" })
end

-- Surround Mode
local function safe_surround_add()
    local ok, mini_surround = pcall(require, "mini.surround")
    if ok then
        mini_surround.add("visual")
    else
        print("mini.surround not loaded")
    end
end

local function safe_surround_replace()
    local ok, mini_surround = pcall(require, "mini.surround")
    if ok then
        mini_surround.replace()
    else
        print("mini.surround not loaded")
    end
end

local function safe_surround_delete()
    local ok, mini_surround = pcall(require, "mini.surround")
    if ok then
        mini_surround.delete()
    else
        print("mini.surround not loaded")
    end
end

local function setup_surround_keymaps()
    vim.keymap.set("n", "ms", safe_surround_add, { noremap = true, desc = "Surround selection" })
    vim.keymap.set("n", "mr", safe_surround_replace, { noremap = true, desc = "Replace surround" })
    vim.keymap.set("n", "md", safe_surround_delete, { noremap = true, desc = "Delete surround" })
end

-- Setup all Helix-style keymaps
local function setup_undo_redo_keymaps()
    vim.keymap.set("n", "u", vim.cmd.undo, { desc = "Undo" })
    vim.keymap.set("n", "U", vim.cmd.redo, { desc = "Redo" })
end

M.setup = function()
    setup_view_mode_keymaps()
    setup_movement_keymaps()
    setup_lsp_keymaps()
    setup_navigation_motions()
    setup_surround_keymaps()
    setup_undo_redo_keymaps()
end

return M