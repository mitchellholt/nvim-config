vim.g.mapleader = " "
-- enter netrw
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
-- copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>nh", vim.cmd.nohl)
