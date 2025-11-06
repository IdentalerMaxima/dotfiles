return {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        local lspconfig = require("lspconfig")

        -- example: install pyright and tsserver
        lspconfig.pyright.setup({})
        lspconfig.ts_ls.setup({})
    end
}

