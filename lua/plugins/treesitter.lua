return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "main",
        lazy = false,
        opts = {
            highlight = {
                enable = true,
                disable = { "latex", "matlab" },
                additional_vim_regex_highlighting = false,
            },

            ensure_installed = {
                "html",
                "css",
                "javascript",
                "haskell",
                "c",
            },

            sync_install = false,
            auto_install = true
        }
    }
}
