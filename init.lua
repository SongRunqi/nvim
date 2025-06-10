require("config.lazy")
require("remap")

require('lazy').setup({
	{"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
	{ 'nvim-lua/plenary.nvim' },
	{ 'ThePrimeagen/harpoon'},
	{ 'nvim-treesitter/playground'}
})
