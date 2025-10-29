-- lua/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",  -- load only when :Telescope is called
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },
                file_ignore_patterns = { "node_modules", ".git/" },
            },
        })

        -- Optional: load extensions here if you use them
        -- telescope.load_extension("fzf")
        -- telescope.load_extension("projects")
    end,
}

