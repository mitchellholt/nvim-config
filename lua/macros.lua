local ent = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

-- Formatting: go to first commma on the line and insert a newline before it
vim.fn.setreg("c", "_f,i" .. ent .. esc .. "_")
