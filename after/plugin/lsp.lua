local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
	'hls',
	'rust_analyzer',
	'pylsp',
	'clangd',
    'lua_ls',
    'elmls',
    'emmet_language_server',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})


-- python stuff
require('lspconfig').pylsp.setup({
    filetypes = {'python'},
    settings = {
        configurationSources = {"flake8"},
        formatCommand = {"black"},
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_params = true,
                },
                jedi_signature_help = {enabled = true},
                pyflakes={enabled=true},
                pylsp_mypy={enabled=false},
                pycodestyle={
                enabled=true,
                ignore={'E501', 'W503', 'E261', 'E262'},
                maxLineLength=120},
                yapf={enabled=true}
            }
        }
    }
})

-- dafny
require('lspconfig').dafny.setup({
    cmd = { "dafny", "server", "--verification-time-limit", "20" },
    filetypes = { "dfy", "dafny" },
})


require('lspconfig').emmet_language_server.setup({
    filetypes = { "css", "html" },
})
