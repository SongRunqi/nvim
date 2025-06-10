-- self
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set('n', '<leader>a', function() mark.add_file() end)
vim.keymap.set('n', '<C-e>', function() ui.toggle_quick_menu() end)


vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
