-- Create an augroup for spellcheck to keep the config organized
local spell_group = vim.api.nvim_create_augroup("TexSpellcheck", { clear = true })

-- Enable spell check specifically for tex files
vim.api.nvim_create_autocmd("FileType", {
  group = spell_group,
  pattern = "tex",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_ca"
  end,
})

