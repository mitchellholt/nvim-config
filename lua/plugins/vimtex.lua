return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_compiler_latexmk = {
            executable = "latexmk",
            options = {
                "--shell-escape"
            }
        }
        vim.g.vimtex_view_method = 'galley'
    end
}
