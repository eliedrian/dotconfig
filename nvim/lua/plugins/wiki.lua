return {
	'vimwiki/vimwiki',
	keys = { '<leader>ww', '<leader>wt', '<leader>ws' },
	ft = { 'mediawiki', 'vimwiki' },
	init = function() 
			vim.g.vimwiki_list = {{
					path = '~/vimwiki',
			}}
	end,
	config = function()
			local vimwiki_group = vim.api.nvim_create_augroup('vimwiki_group', { clear = true })
			vim.api.nvim_create_autocmd({ 'BufEnter', 'BufRead', 'BufWinEnter' }, {
					pattern = { '*.wiki' },
					group = vimwiki_group,
					callback = function()
							vim.opt_local.textwidth = 79
							vim.cmd('set filetype=vimwiki')
					end
			})
	end
}
