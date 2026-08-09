return {
	'junegunn/vim-easy-align',
	config = function()
		vim.keymap.set('v', 'ga', '<Plug>(EasyAlign)')
		vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
	end
}
