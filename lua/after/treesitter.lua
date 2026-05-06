local languages = {
  "html",
  "css",
  "javascript",
  "haskell",
  "c",
  "elm",
}

require("nvim-treesitter").install(lanugaes)

vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function() vim.treesitter.start() end,
})
