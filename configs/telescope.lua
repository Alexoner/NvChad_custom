local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})  -- find file
vim.keymap.set('n', '<leader>fs', builtin.live_grep,  {})  -- find string: search file maching string
vim.keymap.set('n', '<leader>fb', builtin.buffers,    {})  -- find buffers
vim.keymap.set('n', '<leader>fh', builtin.help_tags,  {})  -- find help tags
vim.keymap.set('n', '<leader>fg', builtin.git_files,  {})  -- find git files

vim.keymap.set('n', '<C-p>', '<cmd>Telescope<cr>',    {})
vim.keymap.set('n', '<leader>o',  builtin.git_files,  {})  -- shortcut for find git files
