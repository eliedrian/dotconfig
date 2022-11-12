call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/limelight.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/vim-pencil'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/scrollfix'
" Plug 'neovim/nvim-lspconfig'
call plug#end()

" =============================
" Plug 'flass/vim-colorschemes'
" =============================
colorscheme eva01

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
augroup end


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

