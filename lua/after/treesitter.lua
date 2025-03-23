require("nvim-treesitter").setup {
    ensure_install = { "core", "stable" },
}

require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        -- languages to disable on
        disable = { "latex", "matlab" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    ensure_installed = {
        "html",
        "css",
        "javascript",
        "haskell",
        "c",
        "elm",
    },

    sync_install = false,
}
