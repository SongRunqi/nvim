return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- 从chadrc获取当前主题
    local chadrc = require("chadrc")
    local current_theme = chadrc.base46.theme
    
    require('lualine').setup({
      options = {
        theme = current_theme,
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 
          {
            'mode',
            fmt = function(str)
              return str:sub(1,1)  -- 只显示模式首字母
            end
          }
        },
        lualine_b = { 
          {
            'branch',
            icon = '',
            color = { gui = 'bold' }
          },
          {
            'diff',
            symbols = { added = '+', modified = '~', removed = '-' }
          },
          {
            'diagnostics',
            symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' }
          }
        },
        lualine_c = { 
          {
            'filename',
            file_status = true,
            newfile_status = false,
            path = 1,
            symbols = {
              modified = ' ●',
              readonly = ' ',
              unnamed = ' [No Name]',
              newfile = ' [New]',
            }
          }
        },
        lualine_x = { 
          {
            'filetype',
            colored = true,
            icon_only = false,
            icon = { align = 'right' }
          },
          {
            function()
              local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return '🔴 LSP Down'
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return '🟢 ' .. client.name
                end
              end
              return '🟡 LSP Idle'
            end,
            color = function()
              local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return { fg = '#ff6b6b', gui = 'bold' }  -- 红色 - 无LSP
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return { fg = '#51cf66', gui = 'bold' }  -- 绿色 - LSP运行
                end
              end
              return { fg = '#ffd43b', gui = 'bold' }  -- 黄色 - LSP空闲
            end,
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
            icon = ''
          }
        }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      extensions = { 'nvim-tree', 'toggleterm', 'trouble' }
    })
  end
}