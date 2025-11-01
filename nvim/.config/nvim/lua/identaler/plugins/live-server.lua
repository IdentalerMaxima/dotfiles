-- e.g., in lua/plugins/live-server.lua
return {
  "barrett-ruth/live-server.nvim",
  build = "npm install -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
  config = function()
    require("live-server").setup({
      host = "127.0.0.1",
      port = 0,           -- 0 means pick a free port
      root = nil,         -- nil = use project root
      open = true,        -- open in browser
      ignore = "node_modules",
      -- more options if you like
    })
  end,
}

