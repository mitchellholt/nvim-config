return {
  'nvim-treesitter/nvim-treesitter-context',
  opts = {},
  dependencies = {},
  lazy = false,
  config = function()
    require("after.treesitter-context")
  end
}
