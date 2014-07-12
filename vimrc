set nocompatible              " be iMproved, required

" ======================
let mapleader = ","
let maplocalleader = "-"
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

set history=1000  " Number of things to remember in history.
"set autowrite  " Writes on make/shell commands
"set autoread
set timeoutlen=500  " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed  " Yanks go on clipboard instead.
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard

set hidden " The current buffer can be put to the background without writing to disk
" Match and search
set nohlsearch  " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch  

set nowrap
set textwidth=0" Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start" more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set cindent

set splitbelow
set splitright

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"   ".vimrc
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>


" highlight tabs and trailing spaceC
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif
"set list

syntax on

" default localleader is \
nnoremap <silent> <LocalLeader>rs :source ~/vimrc/vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/vimrc/vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/vimrc/vimrc<CR>

" ======================
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)
"

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'vim-airline'
Plugin 'roman/golden-ratio'
let g:golden_ratio_exclude_nonmodifiable = 1

Plugin 'lsdr/monokai'

Plugin 'SuperTab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'matchit.zip'
Plugin 'regedarek/ZoomWin'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'jiangmiao/auto-pairs'

" ===================================
" manually checkout this version of nerdtree
"  git co 205367ab3f46dcc88b6ebb819a276e793a21e995
"    HEAD is now at 205367a... update changelog/credits and bump to version 4.2.0
Plugin 'scrooloose/nerdtree'
let g:NERDTreeMapOpenVSplit = "<C-v>"
let g:NERDTreeMapOpenSplit = "<C-s>"
"let g:NERDTreeWinSize = 10
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent> <C-d> :execute ':edit '.expand("%:p:h")<CR>

Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = "<C-t>"
let g:ctrlp_cmd = 'CtrlPMixed'

Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'


Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'airblade/vim-gitgutter'
let g:gitgutter_signs = 0
highlight SignColumn ctermbg=black

Plugin 'tpope/vim-fugitive'

Plugin 'ack.vim'

" Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
" colorscheme molokai

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ======================

function! ToggleVerbose()
  if &hls
    :GitGutterSignsDisable
    set nonumber
    set nohls
    set nolist!
  else
    :GitGutterSignsEnable
    set number
    set hls
    set nolist!
  endif
endfunction
nmap <silent> <F3> :call ToggleVerbose()<CR>

" ---- Ack ----
nmap <Leader>g cd<C-w><C-l>:LAck 

set ls=2
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

vnoremap < <gv
vnoremap > >gv

" wildmenu
set wmnu
set wildmode=list:longest

" tell vim to keep a backup file
set backup
" tell vim where to put its backup files
set backupdir=/var/tmp
" tell vim where to put swap files
set dir=/var/tmp

"nmap <silent> <C-b> :BuffergatorToggle<CR>

" show files and buffers

