local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>ps', builtin.live_grep)
vim.keymap.set('n', '<leader>pb', builtin.buffers)

vim.cmd [[packadd cfilter]]

require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["<c-d>"] = require('telescope.actions').delete_buffer
            },
            i = {
                ["<c-d>"] = require('telescope.actions').delete_buffer
            }
        }
    }
})
