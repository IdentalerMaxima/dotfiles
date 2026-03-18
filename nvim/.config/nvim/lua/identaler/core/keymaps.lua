-- Set leader to space
vim.g.mapleader = " "

-- Shorthand for keymaps
local map = vim.keymap.set

-- Example keymaps
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>c", ":%y+<CR>", { desc = "Yank entire file", remap = false })
map("v", "<leader>c", '"+y', { desc = "Yank selection to clipboard", remap = false })

-- Toggle file tree
-- map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- Buffer navigation
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })
map("n", "<leader>bb", "<C-^>", { desc = "Go to last buffer" })

-- Hover info
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover / Info" })

-- Show diagnostic floating window
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Open file explorer
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "Open file explorer" })

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>t", function()
  -- Look for existing terminal buffers
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      -- Jump to it
      vim.api.nvim_set_current_buf(buf)
      return
    end
  end
  -- If none exists, open a new terminal in current window
  vim.cmd("term")
end, { desc = "Terminal in current buffer" })

