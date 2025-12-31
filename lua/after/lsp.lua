vim.opt.signcolumn = "yes"

-- NOTE: this must be executed before any lsp configurations
vim.lsp.config( '*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})

-- Features that only work when an Lsp is attached
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    references = function()
      vim.lsp.buf.references(nil, {
        on_list = function(items, title, context)
          vim.fn.setqflist({}, ' ', items)
          vim.cmd.cfirst()
        end,
      })
    end

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover({border="rounded"})<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>', opts)
    vim.keymap.set("n", '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  end,
})

local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm(),

  })
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN]  = '▲',
      [vim.diagnostic.severity.HINT]  = '⚑',
      [vim.diagnostic.severity.INFO]  = '»',
    },
  },
})


vim.diagnostic.config({
  virtual_text = true,
  float = { border="rounded" }
})

vim.lsp.config("emmet_language_server", {
  filetypes = { "css", "html" }
})

vim.lsp.enable({
  "hls",
  "emmet_language_server",
  "ts_ls",
  "clangd",
  "texlab",
  "pylsp",
  "elmls"
})
