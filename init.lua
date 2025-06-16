-- Base46 cache for NvChad UI
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

require("config.lazy")

-- Load NvChad highlights after lazy setup
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

require("config.init")
require("config.keymaps")
require("config.autocmds")
require("lsp")
