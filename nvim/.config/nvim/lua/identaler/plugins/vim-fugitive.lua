return {
  "tpope/vim-fugitive",

  config = function()
    -- Optional keymaps for common Git actions
    local map = vim.keymap.set

    map("n", "<leader>gs", ":Gstatus<CR>", { desc = "Git status" })
    map("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })
    map("n", "<leader>gb", ":Gblame<CR>", { desc = "Git blame" })
    map("n", "<leader>gc", ":Gcommit<CR>", { desc = "Git commit" })
    map("n", "<leader>gp", ":Gpush<CR>", { desc = "Git push" })
  end,
}

