""""""""""""""""""""""""""""""""""""""""""""""""""
" Darryl's .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Credits:
"   amix - https://github.com/amix/vimrc
"   junegunn - https://github.com/junegunn/vim-plug
"   morhetz - https://github.com/morhetz/gruvbox
"   vim-airline - https://github.com/vim-airline/vim-airline
"   edkolev - https://github.com/tmuxline.vim
"   christoomey - https://github.com/vim-tmux-navigator
"
" Sections:
"   vim-plug
"   General
"   Rebinds
"
""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""
"   vim-plug
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

Plug 'vim-airline/vim-airline'
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" tmuxline
Plug 'edkolev/tmuxline.vim'
let g:airline#extensions#tmuxline#enabled = 0

" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" Plugins end
call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of histroy VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

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

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4

" Set auto indent
set autoindent

" Set wrap lines
" set wrap

" Natural split opening
set splitbelow
set splitright



""""""""""""""""""""""""""""""""""""""""""""""""""
" Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Remap escape in insert mode to kj
inoremap kj <esc>

" Remap escape in command mode to kj
cnoremap kj <C-C>

" Remap leader to Space
let mapleader = "\<Space>"

" Remap vim splits
nnoremap <leader>v :vs<Space>
nnoremap <leader>s :sp<Space>

