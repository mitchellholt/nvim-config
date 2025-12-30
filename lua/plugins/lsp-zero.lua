return {
    "VonHeikemen/lsp-zero.nvim",
    lazy = false,
    dependencies = {
        { "neovim/nvim-lspconfig", lazy = false, },
        { 'hrsh7th/nvim-cmp', lazy = false },
        {'hrsh7th/cmp-nvim-lsp', lazy = false },
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
            lazy = false
        },
        { 'williamboman/mason-lspconfig.nvim', lazy = false },
    },
    config = function()
        -- require("after.lsp")
        require("mason").setup()
        require("mason-lspconfig").setup()
    end
}
