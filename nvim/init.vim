call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/limelight.vim'
"Plug 'lervag/wiki.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/vim-pencil'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/scrollfix'
Plug 'vimwiki/vimwiki'
" Plug 'neovim/nvim-lspconfig'
call plug#end()

" =============================
" Plug 'flass/vim-colorschemes'
" =============================
colorscheme jellybeans

" =====================================
" Plug 'vim-airline/vim-airline'
" and
" Plug 'vim-airline/vim-airline-themes'
" =====================================

" use powerline fonts
let g:airline_powerline_fonts=1

" use terminal theme colors
let g:airline_theme='base16'

" add vim-pencil statusmode
let g:airline_section_x = '%{PencilMode()}'

" =======================
" General editor settings
" =======================

" show line numbers
set number
set relativenumber

" show column line ruler
set cc=79

" true color support
set termguicolors

" on save commands
augroup onsave
	" source init.vim immediately after saving
	autocmd BufWritePost init.vim source $MYVIMRC
augroup end

" smart case search
set ignorecase
set smartcase

" set timeout for keyboard shortcuts
set timeoutlen=250

" jump to next match when searching
set incsearch

" set command history to a lot more
set history=10000

" set default tabs/spaces
set ts=4 sts=4 sw=4 noexpandtab

" set tabs or spaces depending on filetype
augroup spacing
	" Syntax of these languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	" Customisations based on house-style (arbitrary)
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType vue setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType sql setlocal ts=4 sts=4 sw=4 expandtab
	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
	autocmd FileType tex setlocal ts=2 sts=2 sw=2 expandtab
augroup end

" set stuff related to neomutt mail files
au BufNewFile,BufRead neomutt-* setlocal tw=72 fo=awq comments+=nb:>

" set vimwiki stuff
au BufNewFile,BufRead *.wiki setlocal tw=79


" ==================
" Keyboard shortcuts
" ==================

" remap leader key to ,
let mapleader=","

" Quick window focus mapping
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" write current file shortcut
nmap <leader>w :w<CR>

" clear search highlight with <Space>
nmap <silent> <Space> :nohlsearch<CR>

" map %% to expand to current dir in command mode
cmap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" open current directory in various buffers
nmap <leader>ew :e %%
nmap <leader>ev :vsp %%
nmap <leader>es :sp %%

" remap kj to move to Esc
inoremap kj <Esc> 

" =============
" NetRW options
" =============

" remove banner
let g:netrw_banner=0

" use tree list style
let g:netrw_liststyle=3

" =================
" Limelight options
" Plug 'junegunn/limelight.vim'
" =================

" set Limelight coefficient
let g:limelight_default_coefficient=0.4

" shortcut to toggle limelight
nmap <leader>l :Limelight!!<CR>
xmap <leader>l <Plug>(Limelight)

" =================
" Scrollfix options
" Plug 'vim-scripts/scrollfix'
" =================

" don't inform that scrollfix is happening
let g:scrollinfo=0

" ===========================
" Plug 'preservim/vim-pencil'
" ===========================

" toggle pencil shortcut
nmap <leader>p :PencilToggle<CR>

" ===============================================
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ===============================================

" bind tab to select autocompletion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-,> to trigger completion.
if has('nvim')
	imap <silent><expr> <c-@> coc#refresh()
else
	imap <silent><expr> <c-@> coc#refresh()
endif

" set hidden chars
set hidden

" ux improvement
set updatetime=300

" more space for coc messages
set cmdheight=2

" no pass message to inc-completion
set shortmess+=c

" show signcolumn?
set signcolumn=yes

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" native statusline support
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"lua <<EOF
"require'lspconfig'.ccls.setup{}
"EOF

set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

"" =============================
"" Plug 'lervag/wiki.vim'
"" =============================
"let g:wiki_root = '~/wiki'
"let g:wiki_select_method = {
"			\ 'pages': function('wiki#fzf#pages'),
"			\ 'tags': function('wiki#fzf#tags'),
"			\ 'toc': function('wiki#fzf#toc'),
"			\}
"let g:wiki_export = {
"			\ 'args' : '--pdf-engine=lualatex',
"			\ 'from_format' : 'markdown',
"			\ 'ext' : 'pdf',
"			\ 'link_ext_replace': v:false,
"			\ 'view' : v:false,
"			\ 'output': fnamemodify(tempname(), ':h'),
"			\}
"
"
"" remap wiki.vim stuff to not overload <leader>w (save)
"" it's case sensitive
"let g:wiki_mappings_global = {
"	\ '<plug>(wiki-index)' : '<leader>WW',
"	\ '<plug>(wiki-open)' : '<leader>WN',
"	\ '<plug>(wiki-journal)' : '<leader>W<leader>W',
"	\ '<plug>(wiki-reload)' : '<leader>WX',
"	\ '<plug>(wiki-pages)' : '<leader>WP',
"	\}
"let g:wiki_mappings_local = {
"    \ '<plug>(wiki-graph-find-backlinks)' : '<leader>Wgb',
"    \ '<plug>(wiki-graph-related)' : '<leader>Wgr',
"    \ '<plug>(wiki-graph-check-links)' : '<leader>Wgc',
"    \ '<plug>(wiki-graph-check-links-g)' : '<leader>WgC',
"    \ '<plug>(wiki-graph-check-orphans)' : '<leader>WgO',
"    \ '<plug>(wiki-graph-in)' : '<leader>Wgi',
"    \ '<plug>(wiki-graph-out)' : '<leader>Wgo',
"    \ '<plug>(wiki-link-transform)' : '<leader>Wf',
"    \ '<plug>(wiki-page-delete)' : '<leader>Wd',
"    \ '<plug>(wiki-page-rename)' : '<leader>Wr',
"    \ '<plug>(wiki-page-toc)' : '<leader>Wt',
"    \ '<plug>(wiki-page-toc-local)' : '<leader>WT',
"    \ '<plug>(wiki-export)' : '<leader>Wp',
"    \ 'x_<plug>(wiki-export)' : '<leader>Wp',
"    \ '<plug>(wiki-link-show)' : '<leader>Wll',
"    \ '<plug>(wiki-link-extract-header)' : '<leader>Wlh',
"    \ '<plug>(wiki-tag-list)' : '<leader>Wsl',
"    \ '<plug>(wiki-tag-reload)' : '<leader>Wsr',
"    \ '<plug>(wiki-tag-rename)' : '<leader>Wsn',
"    \ '<plug>(wiki-tag-search)' : '<leader>Wss',
"	\}
"let g:wiki_mappings_local_journal = {
"	\ '<plug>(wiki-journal-toweek)' : '<leader>Wu',
"	\ '<plug>(wiki-journal-tomonth)' : '<leader>Wm',
"	\}
