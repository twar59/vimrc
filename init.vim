" reference: https://www.smoothterminal.com/articles/neovim-for-elixir
"
" let g:python_host_prog='/home/twar59/.conda/envs/RP/bin/python'
" let g:python3_host_prog='/home/twar59/.conda/envs/RP/bin/python3'

call plug#begin()

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'

" - Improved netrw (not used, seems this is overridden by NERDTree)
Plug 'tpope/vim-vinegar'

Plug 'scrooloose/nerdtree'
let g:NERDTreeMapOpenVSplit = "<C-v>"
let g:NERDTreeMapOpenSplit = "<C-s>"
"let g:NERDTreeWinSize = 10
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent> <C-d> :execute ':edit '.expand("%:p:h")<CR>

Plug 'kien/ctrlp.vim'
let g:ctrlp_map = "<C-t>"
let g:ctrlp_cmd = 'CtrlP' " 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'c'
"  c - the directory of the current file.
"  a - like "c", but only applies when the current working directory outside of
"      CtrlP isn't a direct ancestor of the directory of the current file.
"  r - the nearest ancestor that contains one of these directories or files:
"      .git .hg .svn .bzr _darcs
"  w - begin finding a root from the current working directory outside of CtrlP
"      instead of from the directory of the current file (default). Only applies
"      when "r" is also present.
"  0 or <empty> - disable this feature.




let g:ctrlp_reuse_window = 'netrw\|help\|nerd'
" Plug 'scrooloose/syntastic'
" Plug 'sheerun/vim-polyglot'

" ---- autocomplete and snippets
Plug 'Shougo/deoplete.nvim' ", { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Elixir sense - used by deoplete
Plug 'slashmili/alchemist.vim'

if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet.vim'   " use C-k
Plug 'Shougo/neosnippet-snippets'
" ---- 


" ---- Elixir Specific
Plug 'elixir-editors/vim-elixir'  " syntax?
Plug 'thinca/vim-ref'   " docs - use S-k

" This conflicts with neosnip
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" -----
"
call plug#end()

" Use comma for leader
let g:mapleader=','
set number " line numbering

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase
" Ignore case when searching lowercase
set smartcase
" Stop highlighting on Enter
map <CR> :noh<CR>

" Set the title of the iterm tab
set title

autocmd BufNewFile,BufRead *.ex,*.exs set syntax=elixir
autocmd BufNewFile,BufRead *.eex set syntax=eelixir

" Syntactic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0



" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2


" ---- Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
