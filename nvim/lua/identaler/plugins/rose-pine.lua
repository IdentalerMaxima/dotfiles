-- lua/plugins/rose-pine.lua
return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "auto",        -- auto, main, moon, or dawn
            dark_variant = "main",   -- main, moon, or dawn
            styles = { bold = true, italic = true },
            transparency = true,     -- enable semi-transparent background
            dim_inactive_windows = false,
        })

        -- Apply the colorscheme
        vim.cmd("colorscheme rose-pine")

        -- Optional: remove background from UI elements
        vim.cmd([[
            hi Normal guibg=NONE ctermbg=NONE
            hi NormalNC guibg=NONE ctermbg=NONE
            hi SignColumn guibg=NONE ctermbg=NONE
        ]])
    end
}

