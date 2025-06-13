return {
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            local function my_on_attach(bufnr)
                local api = require "nvim-tree.api"
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                
                -- Load default mappings first
                api.config.mappings.default_on_attach(bufnr)
                
                -- Override Enter key behavior - only open files, just expand folders
                vim.keymap.del("n", "<CR>", { buffer = bufnr })
                vim.keymap.set("n", "<CR>", function()
                    local node = api.tree.get_node_under_cursor()
                    if node then
                        if node.type == "file" then
                            api.node.open.edit()
                        elseif node.type == "directory" then
                            api.node.open.edit()  -- Just expand/collapse, don't navigate
                        end
                    end
                end, opts("Open file or expand directory"))
            end
            
            require("nvim-tree").setup({
                on_attach = my_on_attach,
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    root_folder_label = false,
                    group_empty = false,  -- Disable grouping empty directories
                },
                filters = {
                    dotfiles = true,
                },
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
            })
        end
    }
}
