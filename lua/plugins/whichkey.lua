return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>d", group = "Debug" },
      { "<leader>de", desc = "DAP eval expression" },
      { "<leader>e", desc = "Toggle NvimTree" },
      { "<leader>f", desc = "Format buffer" },
      { "<leader>g", group = "Git" },
      { "<leader>gs", desc = "Git status" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>ha", desc = "Add file" },
      { "<leader>hm", desc = "Quick menu" },
      { "<leader>h1", desc = "File 1" },
      { "<leader>h2", desc = "File 2" },
      { "<leader>h3", desc = "File 3" },
      { "<leader>h4", desc = "File 4" },
      { "<leader>p", group = "Project/Find" },
      { "<leader>pf", desc = "Find files" },
      { "<leader>ps", desc = "Search string" },
      { "<leader>pv", desc = "File explorer" },
      { "<leader>q", desc = "Diagnostic quickfix" },
      { "<leader>t", group = "Todo/Terminal" },
      { "<leader>tl", desc = "Todo location list" },
      { "<leader>tt", desc = "Toggle terminal" },
      { "<leader>u", desc = "Toggle undotree" },
      -- Non-leader keymaps
      { "<C-p>", desc = "Git files" },
      { "]t", desc = "Next todo comment" },
      { "[t", desc = "Previous todo comment" },
      { "]e", desc = "Next error" },
      { "[e", desc = "Previous error" },
      { "jk", desc = "Exit insert mode", mode = "i" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
