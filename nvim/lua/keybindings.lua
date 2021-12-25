-- KEYBINDINGS
-- Plugin specific keybindings are in the plugin's config files.

-- Remap space as leader key. Leader key is a special key that will allow us to make some additional keybindings.
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Use ; for commands
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Remapping the split/pane nagivation keys (replace Ctrl+w+j by Ctrl+j)
vim.api.nvim_set_keymap('n', '<C-J>', "<C-W><C-J>", { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', "<C-W><C-K>", { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', "<C-W><C-L>", { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', "<C-W><C-H>", { silent = true, noremap = true })

-- Use jj as an alternative to Esc to go to normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
