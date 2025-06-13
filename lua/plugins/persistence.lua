return {
    {
        "folke/persistence.nvim",
        event = "VimEnter",
        config = function()
            require("persistence").setup({
                options = { "buffers", "curdir", "tabpages", "winsize" },
                save_empty = false,
            })
            
            -- Close NvimTree before saving session (proper way)
            vim.api.nvim_create_autocmd("User", {
                pattern = "PersistenceSavePre",
                callback = function()
                    vim.cmd("NvimTreeClose")
                end,
            })
            
            -- Reopen NvimTree after loading session
            vim.api.nvim_create_autocmd("User", {
                pattern = "PersistenceLoadPost", 
                callback = function()
                    vim.defer_fn(function()
                        vim.cmd("NvimTreeOpen")
                    end, 100)
                end,
            })
            
            -- Auto-save session when buffers change
            local function auto_save()
                require("persistence").save()
            end
            
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufDelete", "BufWipeout" }, {
                callback = function()
                    if vim.bo.filetype ~= "NvimTree" then
                        vim.defer_fn(auto_save, 100)
                    end
                end,
            })
        end,
    }
}