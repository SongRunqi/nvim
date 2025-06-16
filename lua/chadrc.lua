-- NvChad configuration
local M = {}

-- Base46 theme configuration (updated format)
M.base46 = {
  theme = "gruvbox",
}

-- UI configuration
M.ui = {
  -- Toggle statusline visibility
  order = {   "tabs", "btns"  },

  statusline = {
    enabled = false,  -- 禁用NvChad状态栏
  },
  -- Toggle tabufline (buffer + tab line)
  tabufline = {
    show_numbers = false,
    enabled = true,
  },
}

return M
