local ent = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

-- Formatting: go to the first commma on the line and insert a newline BEFORE it
vim.fn.setreg("c", "_f,i" .. ent .. esc .. "_")
-- Formatting: go to the first comma on the line and insert a newline AFTER it.
vim.fn.setreg("n", "_f,a" .. ent .. esc .. "_")
