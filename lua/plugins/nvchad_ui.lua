return {
  {
    "nvim-lua/plenary.nvim",
  },
  { 
    "nvim-tree/nvim-web-devicons", 
    lazy = true 
  },
  {
    "NvChad/ui",
    dependencies = { "NvChad/volt", "NvChad/base46" },
    lazy = false,
    config = function()
      require("nvchad")
    end
  },
  {
    "NvChad/volt",
    lazy = true,
  },
  {
    "NvChad/base46",
    lazy = false,
    priority = 1000,
  },
}