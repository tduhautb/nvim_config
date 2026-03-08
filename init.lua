require("config.lazy")

vim.opt.number = true
vim.opt.cursorline = true

vim.opt.background = "dark"

vim.opt.swapfile = false
vim.opt.undofile = true

-- colorscheme
-- vim.cmd.colorscheme("monokai-nightasty")
require("bearded").setup({
  flavor = "monokai-stone",          -- see flavor list below
  transparent = false,
  bold = true,
  italic = true,
  dim_inactive = false,
  terminal_colors = true,
})
vim.cmd.colorscheme("bearded")

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 espaces pour les tabulations
vim.opt.shiftwidth = 2 -- 2 espaces pour la taille des indentations
vim.opt.expandtab = true -- change les tabulations en espaces (don't feed the troll please ;) )
vim.opt.autoindent = true -- on garde l'indentation actuelle à la prochaine ligne

-- Language server protocol config
vim.lsp.config('clangd', require('plugins.lsp.clangd'))
vim.lsp.enable('clangd')

-- Autocomplete config
vim.opt.completeopt = { "menuone", "noinsert", "popup" }
vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true, silent = true })
vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-p>' or '<Tab>'
end, { expr = true, silent = true })
