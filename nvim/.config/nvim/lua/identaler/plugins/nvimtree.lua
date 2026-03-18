-- lua/plugins/nvimtree.lua
return {
  {
    "nvim-tree/nvim-tree.lua",         -- plugin repo
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
    config = function()
      require("nvim-tree").setup({
        auto_reload_on_write = true,
        hijack_cursor = true,
        update_cwd = true,
        view = { width = 50, side = "left" },
        filters = { dotfiles = false },
      })

      -- Optional keymap
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },
}

