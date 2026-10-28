-- Enable spell check specifically for tex files
local tex_group = vim.api.nvim_create_augroup("LaTeX", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = tex_group,
  pattern = "tex",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_ca"
    vim.opt_local.foldenable = true
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "vimtex#fold#level(v:lnum)"
    vim.opt_local.foldlevel = 0
  end,
})

-- Set comment string for maple
vim.api.nvim_create_autocmd("FileType", {
  pattern = "maple",
  callback = function() vim.bo.commentstring = "# %s" end,
})
