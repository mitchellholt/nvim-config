vim.g.mapleader = " "
-- enter netrw
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
-- copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>nh", vim.cmd.nohl)

-- select in line
vim.cmd([[
  xnoremap il g_o^
  onoremap il :<C-u>normal vil<CR>
]])


-- quickfix list delete keymap
function Remove_qf_item()
  local curqfidx = vim.fn.line('.')
  local qfall = vim.fn.getqflist()

  if #qfall == 0 then return end

  table.remove(qfall, curqfidx)
  vim.fn.setqflist(qfall, 'r')

  vim.cmd('copen')  

  local new_idx = curqfidx < #qfall and curqfidx or math.max(curqfidx - 1, 1)

  local winid = vim.fn.win_getid()
  vim.api.nvim_win_set_cursor(winid, {new_idx, 0})
end

vim.cmd("command! RemoveQFItem lua Remove_qf_item()")
vim.api.nvim_command("autocmd FileType qf nnoremap <buffer> dd :RemoveQFItem<cr>")
