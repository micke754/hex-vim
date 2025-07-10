return {
    "echasnovski/mini.clue",
    config = function()
        require("mini.clue").setup({
            triggers = {
                { mode = "n", keys = "<Space>" },
                { mode = "n", keys = "g" },
                { mode = "n", keys = "[" },
                { mode = "n", keys = "]" },
            },
            clues = {
                { mode = "n", keys = "<Space>", file = "Find files", grep = "Live grep", buffers = "Find buffers", help = "Help tags", command = "Command", write = "Write", quit = "Quit", force_quit = "Force quit", open = "Open files", diagnostics = "Line diagnostics" },
                { mode = "n", keys = "g", definition = "Goto definition", type_definition = "Goto type definition", implementation = "Goto implementation", references = "Goto references" },
                { mode = "n", keys = "[", diagnostics = "Previous diagnostic" },
                { mode = "n", keys = "]", diagnostics = "Next diagnostic" },
            },
        })
    end,
}
