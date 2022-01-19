""""""""""""""""
" > INITIAL
""""""""""""""""

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""
" > PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""

" Plugins:
call plug#begin('~/.vim/plugged')

" Plugin overrides
let g:PaperColor_Dark_Override = { 'comment' : '#5f875f' }
" let g:jsx_ext_required = 1 " only allow jsx syntax highlighting if file ends with .jsx

" Keep Plugin commands between plug#begin/end.

"Plug 'airblade/vim-gitgutter'
"Plug 'ajh17/VimCompletesMe'
Plug 'bling/vim-bufferline'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'elzr/vim-json'
"Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-flagship'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

Plug 'diepm/vim-rest-console'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

call plug#end()

""""""""""""""""""""
" > PLUGIN-RELATED
""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-o>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" For git-gutter
"set updatetime=100

" temporary workaround for missing first letter
" https://github.com/scrooloose/nerdtree/issues/916
let NERDTreeNodeDelimiter = "\t"

" Use Ctrl-p to search files using fzf
" https://www.youtube.com/watch?v=DpURGnb4Fyk
nnoremap <C-p> :Files<Cr>

" Use Ctrl-p to search vim buffer using fzf
nnoremap <C-b> :Buffer<Cr>

""""""""""""""""""""
" > CTRL-P PERFORMANCE
""""""""""""""""""""
" https://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
" Cache
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
"if executable('ag')
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

" Ignoring certain paths: https://github.com/kien/ctrlp.vim/issues/58
" Using .ctrlpignore to ignore certain files: thttps://superuser.com/questions/649714/can-i-get-the-vim-ctrlp-plugin-to-ignore-a-specific-folder-in-one-project/900794#900794
let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .ctrlpignore`"'

""""""""""""""""""
" > GENERAL
""""""""""""""""""

" file format is UNIX
set ffs=unix,dos,mac

" comma is more convenient for leader
let mapleader=","

"""""""""""""""""""""
" > VISUAL
"""""""""""""""""""""

" This allows buffers to be hidden if you’ve modified a buffer.
set hidden

" turn on syntax highlighting
syntax on

" Color scheme
set t_Co=256
set background=dark
colorscheme PaperColor
"colorscheme elflord

" Temporary fix for slow navigation in TS files
" TODO: figure out which config / plugin is causing the slowdown
" https://jameschambers.co.uk/vim-typescript-slow
" https://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set re=0

" Syntax coloring
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufRead,BufNewFile *.ipy set filetype=python
au BufRead,BufNewFile *.rest set filetype=rest

"""""""""""""""""""""
" > LINES
"""""""""""""""""""""
" Show line numbers
set number
"set relativenumber

" Current line
set cursorline
"highlight CursorLine cterm=NONE ctermbg=grey ctermfg=white
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermfg=yellow

""""""""""""""""""""""""
" > SEARCHING
""""""""""""""""""""""""
" Ignore case when searching
"set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""
" > INDENTATION + SPACING
"""""""""""""""""""""""""""

" indentation without tabs, tabs get converted to 4 spaces
set expandtab
set ts=4
set sw=2

" auto-indent
set ai

" Show trailing and preceding spaces
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

"""""""""""""""""""""
" > MOUSE
"""""""""""""""""""""

" use mouse in vim
if has("mouse")
    set mouse=a
endif

" resize vim splits in tmux
" https://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
set ttymouse=xterm2
