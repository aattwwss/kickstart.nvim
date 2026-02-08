vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.mapleader = ' '

-- vim.keymap.set({ 'i' }, 'kj', '<Esc>', { silent = true })
vim.keymap.set('n', '<leader>E', ':Explore<CR>')
vim.keymap.set('n', '<leader>f', ':Format<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>:UndotreeFocus<CR>')

vim.keymap.set('n', '<leader>dt', function()
  require('dap-go').debug_test()
end, { desc = '[D]ebug [T]est' })

vim.keymap.set('n', '<leader>dl', function()
  require('dap-go').debug_last_test()
end, { desc = '[D]ebug [L]ast test' })

vim.keymap.set({ 'n', 'v' }, '<leader>de', function()
  require('dapui').eval()
end, { desc = '[D]ebug [E]val expression' })
