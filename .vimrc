""""""""""""""""""""""""""""""""""""""""""""""""""
" Darryl's .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Credits:
"   amix - https://github.com/amix/vimrc
"   junegunn - https://github.com/junegunn/vim-plug
"   morhetz - https://github.com/morhetz/gruvbox
"   vim-airline - https://github.com/vim-airline/vim-airline
"   edkolev - https://github.com/edkolev/tmuxline.vim
"   christoomey - https://github.com/christoomey/vim-tmux-navigator
"   dense-analysis - https://github.com/dense-analysis/ale
"   vim-commentary - https://github.com/tpope/vim-commentary
"   vim-surround - https://github.com/tpope/vim-surround
"   vim-polyglot - https://github.com/sheerun/vim-polyglot
"
" Sections:
"   vim-plug
"   General
"   Rebinds
"
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""

" If vim-plug is not installed then installs it
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Search for plugins on VimAwesome https://vimawesome.com

" Plugins begin
call plug#begin('~/.vim/plugged')

" gruvbox
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark = 'medium'
set bg=dark

" airline
Plug 'vim-airline/vim-airline'
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" tmuxline
Plug 'edkolev/tmuxline.vim'
let g:airline#extensions#tmuxline#enabled = 0

" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" ale
Plug 'dense-analysis/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'python': ['pylint', 'flake8', 'pyls'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'yaml': ['prettier']
\}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1

" vim-commentary
Plug 'tpope/vim-commentary'

" vim-surround
Plug 'tpope/vim-surround'

" vim-polyglot
Plug 'sheerun/vim-polyglot'

" Plugins end
call plug#end()

" Make sure to run source ~&/.vimrc then PlugInstall to install new plugins
" Occassionally run PlugUpdate and PlugUpgrade to update and upgrade plugins


""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of histroy VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Turn on the Wild menu
set wildmenu
set wildmode=longest:list

set number
set relativenumber

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" set which wrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" No sound or visual on errors
set noerrorbells
set visualbell
set t_vb=
" set tm=500

" Enable syntax highlighting
syntax on

" Set colorscheme
try
    colorscheme gruvbox
catch
endtry

" Set color palette
set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
" set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4

" 1 tab == 2 spaces for javascript, css, and yaml
autocmd FileType javascript,css,html,yaml setlocal shiftwidth=2 softtabstop=2

" Set auto indent
set autoindent

" Set wrap lines
" set wrap

" Natural split opening
set splitbelow
set splitright

" Netrw settings
let g:netrw_altv = 1
" Remove banner
let g:netrw_banner = 0
" Set default viewtype to tree
let g:netrw_liststyle = 3
" Set window size
let g:netrw_winsize = 25

" Allows moving back to main split
augroup NetrwRemap
    autocmd FileType netrw nnoremap <buffer> <C-l> :wincmd l<cr>
augroup END

" Set tab to work like <C-n> in autocomplete window
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"


""""""""""""""""""""""""""""""""""""""""""""""""""
" Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Remap escape in insert mode to kj
inoremap kj <esc>

" Remap escape in command mode to kj
cnoremap kj <C-c>

" Remap leader to Space
let mapleader = "\<Space>"

" Remap vim splits
nnoremap <leader>v :vs<Space>
nnoremap <leader>s :sp<Space>

" Swap ' (single quote) and ` (backtick)
noremap ' `
noremap ` '
