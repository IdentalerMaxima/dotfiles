-- Setup plugins
require("lazy").setup({
    -- Lazy itself
    "folke/lazy.nvim",

    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Use the new Neovim 0.11+ API for LSP setup
            local lspconfig = vim.lsp.config

            -- Example: Python LSP
            vim.lsp.start({
                name = "pyright",
                cmd = { "pyright-langserver", "--stdio" },
                root_dir = vim.fs.root(0, { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }),
                capabilities = vim.lsp.protocol.make_client_capabilities(),
            })

            -- Example: Lua LSP
            vim.lsp.start({
                name = "lua_ls",
                cmd = { "lua-language-server" },
                root_dir = vim.fs.root(0, { ".git" }),
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })
        end,
    },

    -- Telescope (fuzzy finder)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            telescope.setup({})

            local map = vim.keymap.set
            map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
            map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
            map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
        end,
    },

    -- NvimTree (file explorer)
    {
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
    },

    -- Mason
    {
  	"williamboman/mason.nvim",
       	config = function()
          require("mason").setup()
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = { "pyright", "lua_ls" },
          })
        end,
      },
})

