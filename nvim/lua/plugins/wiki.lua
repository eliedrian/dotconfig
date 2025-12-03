return {
	'vimwiki/vimwiki',
	keys = { '<leader>ww', '<leader>wt', '<leader>ws' },
	event = { 'BufEnter *.wiki' },
	init = function() 
			vim.g.vimwiki_list = {{
					path = '~/vimwiki',
			}}
	end,
	config = function()
			local vimwiki_group = vim.api.nvim_create_augroup('vimwiki_group', { clear = true })
			vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead' }, {
					pattern = '*.wiki',
					group = vimwiki_group,
					callback = function()
							vim.opt_local.textwidth = 79
					end
			})
	end
}
