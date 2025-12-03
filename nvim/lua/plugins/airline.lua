return {
		{
				'vim-airline/vim-airline',
				lazy = false,
				init = function()
						vim.g.airline_powerline_fonts = 1
				end,
				dependencies = {
						'vim-airline/vim-airline-themes'
				}
		},
		{
				'vim-airline/vim-airline-themes',
				lazy = false,
				init = function()
						vim.g.airline_theme = 'base16'
				end
		}
}
