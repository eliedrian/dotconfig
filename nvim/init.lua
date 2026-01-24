require("config.lazy")

-- =======================
-- General editor settings
-- =======================

-- show line numbers vim.opt.number = true
vim.opt.relativenumber = true

-- preserve current view when jumping through buffers
vim.opt.jumpoptions = { 'stack', 'view' }

-- line count before scrolling buffer
vim.opt.scrolloff = 15

-- highlight current line
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- column line ruler
vim.opt.cc = '79'

-- true color support
vim.opt.termguicolors = true

-- autoreload vimrc on save
local vimrc_group = vim.api.nvim_create_augroup('vimrc_group', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	pattern = vim.env.MYVIMRC,
	group = vimrc_group,
	command = 'source <afile>'
})

-- filetype augroup
local filetype_group = vim.api.nvim_create_augroup('filetype_group', { clear = true })

vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = 'tex',
	group = filetype_group,
	command = 'setlocal ts=2 sts=2 sw=2 expandtab'
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = 'make',
	group = filetype_group,
	command = 'setlocal ts=8 sts=8 sw=8 noexpandtab'
})

-- smart case search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- timeout for keyboard shortcuts
vim.opt.timeoutlen = 280

-- show partial substitutions in quickfix
vim.opt.inccommand = 'split'

-- increase command history size
vim.opt.history = 10000

-- default tab/spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

-- ux improvement
vim.opt.updatetime = 300

-- sign col
vim.opt.signcolumn = 'yes'

-- hidden whitespace characters
vim.opt.listchars = {
		tab = '▸ ',
		eol = '¬'
}

-- fix completion
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

-- =======================
-- General editor settings
-- =========END===========

-- ==================
-- Keyboard shortcuts
-- ==================

-- show whitespace characters
vim.keymap.set('n', '<leader>l', '<cmd>set list!<cr>')

-- Window focus
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- write current file
vim.keymap.set('n', '<leader>w', ':w<cr>')

-- clear search highlight
vim.keymap.set('n', '<space>', ':nohlsearch<cr>', { silent = true })

local expand_current_dir_command = '<C-R>=fnameescape(expand("%:h"))."/"<cr>'

-- expand %% to current dir
vim.keymap.set('c', '%%', expand_current_dir_command)

-- map opening current dir
vim.keymap.set('n', '<leader>ew', ':e ' .. expand_current_dir_command)
vim.keymap.set('n', '<leader>ev', ':vsp ' .. expand_current_dir_command)
vim.keymap.set('n', '<leader>es', ':sp ' .. expand_current_dir_command)

-- ==================
-- Keyboard shortcuts
-- =======END========

-- =====
-- NetRW
-- =====

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- =====
-- NetRW
-- =END=

-- =====
--  LSP
-- =====

local lsp_group = vim.api.nvim_create_augroup('lsp_group', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
		callback = function()
				vim.keymap.set('n', '<C-,>', vim.diagnostic.open_float)
		end
})

vim.lsp.enable({
		'clangd',
		'rust',
})

-- =====
--  LSP
-- =END=
