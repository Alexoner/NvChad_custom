local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles'  })
vim.keymap.set('n', '<leader>fs', builtin.live_grep,  { desc = '[F]ind [S]tring' })
vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = '[F]ind [B]ufers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = '[F]ind [H]elp tags' })
vim.keymap.set('n', '<leader>fg', builtin.git_files,  { desc = '[F]ind [G]it files' })

vim.keymap.set('n', '<C-p>', '<cmd>Telescope<cr>',    { desc = 'Telescope' })
vim.keymap.set('n', '<leader>o',  builtin.git_files,  { desc = 'Open Git files' })
