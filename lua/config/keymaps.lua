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

-- Session management with persistence.nvim (manual only)
vim.keymap.set("n", "<leader>ss", function() require("persistence").save() end, { desc = "Save session" })
vim.keymap.set("n", "<leader>sl", function() require("persistence").load({ last = true }) end, { desc = "Load last session" })
vim.keymap.set("n", "<leader>sS", function() require("persistence").select() end, { desc = "Select session to load" })
vim.keymap.set("n", "<leader>sx", function() require("persistence").delete() end, { desc = "Delete current session" })
vim.keymap.set("n", "<leader>sX", function()
    local sessions_dir = vim.fn.stdpath("state") .. "/sessions/"
    local sessions = vim.fn.glob(sessions_dir .. "*.vim", false, true)
    
    if #sessions == 0 then
        print("No sessions found")
        return
    end
    
    local session_names = {}
    for _, session in ipairs(sessions) do
        table.insert(session_names, vim.fn.fnamemodify(session, ":t:r"))
    end
    
    vim.ui.select(session_names, {
        prompt = "Select session to delete:",
    }, function(choice)
        if choice then
            local session_path = sessions_dir .. choice .. ".vim"
            vim.fn.delete(session_path)
            print("Deleted session: " .. choice)
        end
    end)
end, { desc = "Delete selected session" })
vim.keymap.set("n", "<leader>sq", function() 
    require("persistence").save()
    vim.cmd("qa")
end, { desc = "Save session and quit" })


-- Tab management with scoped buffers
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close other tabs" })
vim.keymap.set("n", "gt", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "gT", "<cmd>tabprev<cr>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tcd", function()
    vim.t.tab_cwd = vim.fn.getcwd()
    print("Set tab directory to: " .. vim.fn.getcwd())
end, { desc = "Set tab working directory" })

vim.keymap.set("n", "<leader>tC", function()
    vim.ui.input({ prompt = "Enter directory: ", default = vim.fn.getcwd() }, function(input)
        if input and vim.fn.isdirectory(input) == 1 then
            vim.cmd("cd " .. input)
            vim.t.tab_cwd = input
            print("Changed tab directory to: " .. input)
        else
            print("Invalid directory: " .. (input or ""))
        end
    end)
end, { desc = "Change tab directory" })

vim.keymap.set("n", "<leader>tp", function()
    local tab_cwd = vim.t.tab_cwd
    if tab_cwd then
        print("Tab directory: " .. tab_cwd)
    else
        print("No tab directory set (using: " .. vim.fn.getcwd() .. ")")
    end
end, { desc = "Print tab directory" })

-- Tab-local directory management (manual only)
-- Note: Auto directory changing is disabled to prevent unwanted directory switches

-- Only store directory when explicitly set with <leader>tcd, not on every tab leave
-- vim.api.nvim_create_autocmd("TabLeave", {
--     callback = function()
--         vim.t.tab_cwd = vim.fn.getcwd()
--     end,
-- })

-- Buffer navigation with Tab keys
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })

-- Buffer management
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<D-w>", "<cmd>bdelete<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })
vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close buffers to the right" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close buffers to the left" })

-- Window navigation - move between split windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- ToggleTerm - floating terminal window
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" }) -- Show/hide terminal
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle vertical terminal" }) -- Vertical terminal
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle horizontal terminal" }) -- Horizontal terminal
vim.keymap.set("t", "<D-v>", '<C-\\><C-n>"+pi', { desc = "Paste in terminal with Cmd+V" }) -- Paste from system clipboard
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Terminal left window" }) -- Move to left window from terminal
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Terminal down window" }) -- Move to down window from terminal
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Terminal up window" }) -- Move to up window from terminal
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Terminal right window" }) -- Move to right window from terminal