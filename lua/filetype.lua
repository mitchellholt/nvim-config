-- Enable spell check specifically for tex files
local spell_group = vim.api.nvim_create_augroup("TexSpellcheck", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = spell_group,
  pattern = "tex",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_ca"
  end,
})

-- Set comment string for maple
vim.api.nvim_create_autocmd("FileType", {
  pattern = "maple",
  callback = function() vim.bo.commentstring = "# %s" end,
})
