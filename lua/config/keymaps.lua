-- ============================================================================
-- KEYMAPS CONFIGURATION
-- ============================================================================
-- Leader key is set to space (default in many configs)
-- 
-- LEADER KEY MAPPINGS:
-- <leader>de     - DAP: Evaluate expression during debugging
-- <leader>e      - NvimTree: Toggle file explorer
-- <leader>f      - Format: Format current buffer (from autoformat.lua)
-- <leader>gs     - Git: Open git status
-- <leader>ha     - Harpoon: Add current file to marks
-- <leader>hm     - Harpoon: Toggle quick menu
-- <leader>h1-4   - Harpoon: Navigate to marked files 1-4
-- <leader>pf     - Telescope: Find files in project
-- <leader>ps     - Telescope: Search for string in project
-- <leader>pv     - File explorer: Open netrw
-- <leader>q      - Diagnostics: Open quickfix list
-- <leader>tl     - Todo: Show all TODO comments in location list
-- <leader>tt     - Terminal: Toggle floating terminal
-- <leader>tv     - Terminal: Toggle vertical terminal
-- <leader>th     - Terminal: Toggle horizontal terminal
-- <leader>t1-4   - Terminal: Toggle specific terminal instances
-- <leader>tT     - Terminal: Toggle tab terminal
-- <leader>ts     - Terminal: Send command to terminal
-- <leader>pt     - Telescope: Terminal manager
-- <leader>tr     - Terminal: Run current file (code runner)
-- <leader>tn     - Terminal: Create new terminal
-- <leader>u      - Undotree: Toggle undo history
-- ============================================================================

-- Clear search highlight on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps - open quickfix list with all diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- File explorer - open netrw file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Insert mode escape - quick exit from insert mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Navigation keymaps - jump to previous/next cursor positions
vim.keymap.set('n', '<D-[>', '<C-o>', { noremap = true, silent = true, desc = "跳转到上一个位置" })
vim.keymap.set('n', '<D-]>', '<C-i>', { noremap = true, silent = true, desc = "跳转到下一个位置" })

-- Undotree - toggle undo history visualization
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Telescope - fuzzy finder and search
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' }) -- Find files in project
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- Find git tracked files
vim.keymap.set('n', '<leader>ps', function() -- Search for string in project
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Harpoon - quick file navigation
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set('n', '<leader>ha', function() mark.add_file() end) -- Add current file to harpoon
vim.keymap.set('n', '<leader>hm', function() ui.toggle_quick_menu() end) -- Toggle harpoon menu
vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end) -- Navigate to file 1
vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end) -- Navigate to file 2
vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end) -- Navigate to file 3
vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end) -- Navigate to file 4

-- Fugitive - Git integration
vim.keymap.set("n", "<leader>gs", vim.cmd.Git) -- Open git status

-- Todo comments navigation
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" }) -- Jump to next TODO/FIXME/etc

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" }) -- Jump to previous TODO/FIXME/etc

-- Diagnostic navigation - jump between LSP errors/warnings
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Next error" }) -- Jump to next diagnostic
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Previous error" }) -- Jump to previous diagnostic

-- Todo comments location list - show all TODOs in quickfix list
vim.keymap.set("n", "<leader>tl", "<cmd>TodoLocList<cr>", { desc = "Todo location list" })

-- DAP UI eval - evaluate expression during debugging
vim.keymap.set("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "DAP UI eval expression" })

-- NvimTree toggle - show/hide file explorer sidebar
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })





-- Buffer navigation with Tab keys (NvChad Tabufline)
vim.keymap.set("n", "<Tab>", function() require("nvchad.tabufline").next() end, { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", function() require("nvchad.tabufline").prev() end, { desc = "Previous buffer" })

-- Buffer management (NvChad Tabufline)
vim.keymap.set("n", "<leader>bd", function() require("nvchad.tabufline").close_buffer() end, { desc = "Delete buffer" })
vim.keymap.set("n", "<D-w>", function() require("nvchad.tabufline").close_buffer() end, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bo", function() require("nvchad.tabufline").closeAllBufs(false) end, { desc = "Close other buffers" })
vim.keymap.set("n", "<leader>br", "<cmd>bdelete<cr>", { desc = "Close buffers to the right" })
vim.keymap.set("n", "<leader>bl", "<cmd>bdelete<cr>", { desc = "Close buffers to the left" })

-- Window navigation - move between split windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- NvChad UI keymaps  
vim.keymap.set("n", "<leader>ch", "<cmd>NvCheatsheet<cr>", { desc = "Open NvChad cheatsheet" })
vim.keymap.set("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "Open theme picker" })



