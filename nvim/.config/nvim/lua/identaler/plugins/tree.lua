return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("nvim-tree").setup({
      view = { width = 30, side = "left" },
      renderer = {
        icons = {
          show = { file = true, folder = true, folder_arrow = true },
        },
      },
      actions = { open_file = { quit_on_open = true } },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      filesystem_watchers = {
        enable = true,
      },
    })

    local map = vim.keymap.set
    map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
  end,
}

