return {
	'nvim-telescope/telescope.nvim',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope = require('telescope')
		
		-- Load the terms extension
		telescope.load_extension('terms')
		
		-- Setup telescope with any additional configuration
		telescope.setup({
			extensions = {
				terms = {
					-- Terminal manager default settings
					defaults = {
						direction = "float",
						size = function(term)
							if term.direction == "horizontal" then
								return 15
							elseif term.direction == "vertical" then
								return vim.o.columns * 0.4
							else
								return 80
							end
						end,
					},
					-- Additional code runners
					code_runners = {
						-- Add custom runners here if needed
					}
				}
			}
		})
	end
}
