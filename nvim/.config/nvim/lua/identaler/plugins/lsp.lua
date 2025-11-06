return {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        local mason = require("mason")
        mason.setup()

        -- New API style
        vim.lsp.start({
            name = "pyright",
            cmd = { "pyright-langserver", "--stdio" },
        })

        vim.lsp.start({
            name = "tsserver",
            cmd = { "typescript-language-server", "--stdio" },
        })
    end
}

