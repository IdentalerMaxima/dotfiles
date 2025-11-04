-- lua/plugins/harpoon.lua
return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      -- Optional: keymaps
      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: Add file" })
      vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Harpoon: Toggle menu" })
      vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon: Go to file 1" })
      vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
    end,
  },
}

