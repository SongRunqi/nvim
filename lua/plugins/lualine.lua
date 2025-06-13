return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'tokyonight',
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = '' },
                    globalstatus = true,
                    disabled_filetypes = { 'alpha', 'dashboard' },
                },
                sections = {
                    lualine_a = { 
                        {
                            'mode',
                            fmt = function(str)
                                return str:sub(1,1)
                            end
                        }
                    },
                    lualine_b = { 
                        {
                            'branch',
                            icon = ''
                        },
                        {
                            'diff',
                            symbols = { added = ' ', modified = ' ', removed = ' ' }
                        },
                        {
                            'diagnostics',
                            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
                        }
                    },
                    lualine_c = { 
                        {
                            'filename',
                            path = 1,
                            symbols = {
                                modified = ' ●',
                                readonly = ' ',
                                unnamed = '[No Name]',
                                newfile = ' ',
                            }
                        }
                    },
                    lualine_x = { 
                        {
                            function()
                                local clients = vim.lsp.get_active_clients()
                                if next(clients) == nil then
                                    return ''
                                end
                                local client_names = {}
                                for _, client in pairs(clients) do
                                    table.insert(client_names, client.name)
                                end
                                return ' ' .. table.concat(client_names, ' ')
                            end,
                            cond = function()
                                return next(vim.lsp.get_active_clients()) ~= nil
                            end
                        },
                        {
                            'encoding',
                            cond = function()
                                return vim.bo.fenc ~= 'utf-8'
                            end
                        },
                        {
                            'filetype',
                            colored = true,
                            icon_only = false,
                            cond = function()
                                return vim.bo.filetype ~= ''
                            end
                        }
                    },
                    lualine_y = { 
                        {
                            'progress',
                            fmt = function(str)
                                return str .. '%%'
                            end
                        }
                    },
                    lualine_z = { 
                        {
                            'location',
                            fmt = function(str)
                                return ' ' .. str
                            end
                        }
                    }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 
                        {
                            'filename',
                            path = 1,
                            color = { fg = '#6c7086' }
                        }
                    },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                extensions = { 'nvim-tree', 'toggleterm', 'trouble' }
            })
        end
    }
}