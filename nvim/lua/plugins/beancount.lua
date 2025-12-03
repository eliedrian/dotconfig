return {
		'nathangrigg/vim-beancount',
		event = { 'BufEnter *.bean' },
		config = function()
				local beancount_group = vim.api.nvim_create_augroup('beancount_group', { clear = true })
				vim.api.nvim_create_autocmd({ 'FileType' }, {
						command = 'lua vim.b.beancount_root = "index.bean"'
				})
		end
}
