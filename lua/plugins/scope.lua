return {
    {
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup({
                restore_state = false,
                hooks = {
                    pre_tab_leave = function()
                        -- Save current tab's buffer list before leaving
                    end,
                    post_tab_enter = function()
                        -- Refresh bufferline when entering a tab
                    end,
                }
            })
        end
    }
}