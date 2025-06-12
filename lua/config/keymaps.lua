-- Clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- File explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Insert mode escape
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Navigation keymaps
vim.keymap.set('n', '<D-[>', '<C-o>', { noremap = true, silent = true, desc = "跳转到上一个位置" })
vim.keymap.set('n', '<D-]>', '<C-i>', { noremap = true, silent = true, desc = "跳转到下一个位置" })

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set('n', '<leader>a', function() mark.add_file() end)
vim.keymap.set('n', '<C-e>', function() ui.toggle_quick_menu() end)
vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)