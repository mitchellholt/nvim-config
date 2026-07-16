local languages = {
  "html",
  "css",
  "javascript",
  "haskell",
  "c",
  "elm",
}

require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function() vim.treesitter.start() end,
})
