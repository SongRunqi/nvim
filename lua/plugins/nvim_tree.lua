return {
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "name",
                },
                live_filter = {
                    prefix = "[FILTER]: ",
                    always_show_folders = true,
                },
                view = {
                    width = 30,
                },
                filters = {
                    dotfiles = false,
                },
                sync_root_with_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = false,
                },
                actions = {
                    open_file = {
                        quit_on_open = false,
                        resize_window = true,
                        window_picker = {
                            enable = true,
                        },
                    },
                },
                renderer = {
                    root_folder_label = ":t",  -- 显示根目录名称
                    highlight_git = true,
                    icons = {
                        show = {
                            git = true,
                        },
                    },
                },
            })
        end
    }
}
