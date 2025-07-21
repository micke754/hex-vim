-- Helix-style command palette (Space mode)

local M = {}

-- Command categories and commands
local commands = {
    files = {
        { name = "Find Files", cmd = "Telescope find_files", key = "f", desc = "Find files" },
        { name = "Find Buffers", cmd = "Telescope buffers", key = "b", desc = "Find buffers" },
        { name = "Recent Files", cmd = "Telescope oldfiles", key = "r", desc = "Recent files" },
        { name = "File Explorer", cmd = "MiniFiles.open", key = "e", desc = "File explorer" },
    },
    search = {
        { name = "Live Grep", cmd = "Telescope live_grep", key = "/", desc = "Live grep" },
        { name = "Grep String", cmd = "Telescope grep_string", key = "s", desc = "Grep string" },
        { name = "Search History", cmd = "Telescope search_history", key = "h", desc = "Search history" },
    },
    lsp = {
        { name = "Document Symbols", cmd = "Telescope lsp_document_symbols", key = "s", desc = "Document symbols" },
        { name = "Workspace Symbols", cmd = "Telescope lsp_workspace_symbols", key = "S", desc = "Workspace symbols" },
        { name = "Diagnostics", cmd = "Telescope diagnostics", key = "d", desc = "Diagnostics" },
        { name = "References", cmd = "Telescope lsp_references", key = "r", desc = "References" },
        { name = "Definitions", cmd = "Telescope lsp_definitions", key = "d", desc = "Definitions" },
    },
    git = {
        { name = "Git Status", cmd = "Telescope git_status", key = "s", desc = "Git status" },
        { name = "Git Commits", cmd = "Telescope git_commits", key = "c", desc = "Git commits" },
        { name = "Git Branches", cmd = "Telescope git_branches", key = "b", desc = "Git branches" },
    },
    config = {
        { name = "Keymaps", cmd = "Telescope keymaps", key = "k", desc = "Keymaps" },
        { name = "Commands", cmd = "Telescope commands", key = "c", desc = "Commands" },
        { name = "Options", cmd = "Telescope vim_options", key = "o", desc = "Options" },
        { name = "Reload Config", cmd = "source %", key = "R", desc = "Reload config" },
    },
}

-- Recent commands history
local recent_commands = {}

-- Show command palette
function M.show_command_palette()
    local picker = require('telescope.pickers').new({}, {
        prompt_title = "Helix Command Palette",
        finder = require('telescope.finders').new_table({
            results = M.get_all_commands(),
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.name .. " " .. (entry.key and ("(" .. entry.key .. ")") or ""),
                    ordinal = entry.name,
                }
            end,
        }),
        sorter = require('telescope.config').values.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    M.execute_command(selection.value)
                end
            end)
            
            return true
        end,
    })
    
    picker:find()
end

-- Get all commands organized by category
function M.get_all_commands()
    local all_commands = {}
    
    for category, cmds in pairs(commands) do
        for _, cmd in ipairs(cmds) do
            cmd.category = category
            table.insert(all_commands, cmd)
        end
    end
    
    -- Add recent commands
    for _, cmd in ipairs(recent_commands) do
        cmd.recent = true
        table.insert(all_commands, 1, cmd)
    end
    
    return all_commands
end

-- Execute command and add to history
function M.execute_command(command)
    if command.cmd then
        vim.cmd(command.cmd)
        
        -- Add to recent commands (limit to 5)
        table.insert(recent_commands, 1, command)
        if #recent_commands > 5 then
            table.remove(recent_commands)
        end
    end
end

-- Quick access keymaps
function M.setup_quick_access()
    -- Space as leader for command palette
    vim.keymap.set("n", "<Space>", M.show_command_palette, { desc = "Command palette" })
    
    -- Direct category access
    vim.keymap.set("n", "<Space>f", function() M.show_category("files") end, { desc = "Files" })
    vim.keymap.set("n", "<Space>s", function() M.show_category("search") end, { desc = "Search" })
    vim.keymap.set("n", "<Space>l", function() M.show_category("lsp") end, { desc = "LSP" })
    vim.keymap.set("n", "<Space>g", function() M.show_category("git") end, { desc = "Git" })
    vim.keymap.set("n", "<Space>c", function() M.show_category("config") end, { desc = "Config" })
    
    -- Quick commands
    for category, cmds in pairs(commands) do
        for _, cmd in ipairs(cmds) do
            if cmd.key then
                local keymap = "<Space>" .. cmd.key
                if category ~= "files" then
                    keymap = "<Space>" .. category:sub(1,1) .. cmd.key
                end
                vim.keymap.set("n", keymap, function() M.execute_command(cmd) end, { desc = cmd.desc })
            end
        end
    end
end

-- Show commands for specific category
function M.show_category(category)
    local category_commands = commands[category] or {}
    
    local picker = require('telescope.pickers').new({}, {
        prompt_title = category:upper() .. " Commands",
        finder = require('telescope.finders').new_table({
            results = category_commands,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.name .. " (" .. entry.key .. ")",
                    ordinal = entry.name,
                }
            end,
        }),
        sorter = require('telescope.config').values.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    M.execute_command(selection.value)
                end
            end)
            
            return true
        end,
    })
    
    picker:find()
end

-- Add custom command
function M.add_command(category, command)
    if not commands[category] then
        commands[category] = {}
    end
    table.insert(commands[category], command)
end

-- Setup command palette
function M.setup()
    M.setup_quick_access()
    
    -- Add user commands
    M.add_command("files", { name = "New File", cmd = "ene", key = "n", desc = "New file" })
    M.add_command("files", { name = "Save File", cmd = "w", key = "w", desc = "Save file" })
    M.add_command("files", { name = "Save As", cmd = "saveas", key = "S", desc = "Save as" })
    M.add_command("config", { name = "Lazy", cmd = "Lazy", key = "l", desc = "Plugin manager" })
    M.add_command("config", { name = "Mason", cmd = "Mason", key = "m", desc = "LSP installer" })
end

return M