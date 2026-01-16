vim.g.mapleader = " "
-- enter netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
-- copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>nh", vim.cmd.nohl)

-- Add blank line above/below current line
vim.cmd([[
  noremap <silent> <C-k> :call append(line('.')-1, '')<CR>
  noremap <silent> <C-j> :call append(line('.'), '')<CR>
]])

-- Previous and next file in quickfix
vim.cmd([[
  noremap [f :cpf<CR>
  noremap ]f :cnf<CR>
]])


-- select in line
vim.cmd([[
  xnoremap il g_o^
  onoremap il :<C-u>normal vil<CR>
]])
