-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})


-- Restore directory when leaving fugitive buffers or help
vim.api.nvim_create_autocmd({'BufLeave', 'WinClosed'}, {
    group = fugitive_group,
    callback = function()
        vim.schedule(function()
            local cwd = vim.fn.getcwd()
            if original_cwd and (cwd:match('fugitive') or cwd:match('share/nvim')) then
                vim.cmd('cd ' .. vim.fn.fnameescape(original_cwd))
                original_cwd = nil
            end
        end)
    end,
})


