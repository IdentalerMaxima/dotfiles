return {
  "nvim-treesitter/playground",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter.configs").setup{
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in ms
        persist_queries = false, -- Save queries across sessions
      }
    }
  end
}

