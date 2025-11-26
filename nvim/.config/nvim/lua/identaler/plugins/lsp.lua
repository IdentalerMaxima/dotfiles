return {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        local mason = require("mason")
        mason.setup()

        local lspconfig = require("lspconfig")
        local util = require("lspconfig.util")

        -- Pyright
        lspconfig.pyright.setup({})

        -- TSServer
        lspconfig.tsserver.setup({
            cmd = { "typescript-language-server", "--stdio" },
            root_dir = function(fname)
                return util.root_pattern("tsconfig.json", "package.json", ".git")(fname)
            end,
        })

        -- Keymaps for LSP diagnostics 
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>li", vim.diagnostic.open_float, opts) -- show error under cursor
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)         -- jump to previous error
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)         -- jump to next error
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts) -- populate location list
    end
}

