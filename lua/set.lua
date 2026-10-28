vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "81"

-- Turn off the mouse clicking
vim.opt.mouse = ""
-- Turn off the mouse scrolling
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })

vim.opt.guicursor = "n-v-c-sm:block"

-- vimtex stuff
vim.g.vimtex_syntax_nospell_comments = 1
vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_fold_types = {
  sections = { parse_levels = 0 },
  items = { enabled = 0 },
  envs = { enabled = 0 }
}
