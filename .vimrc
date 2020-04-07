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
"   coc.nvim - https://github.com/neoclide/coc.nvim
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
let g:ale_linters = {
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'yaml': ['prettier']
\}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

" vim-commentary
Plug 'tpope/vim-commentary'

" vim-surround
Plug 'tpope/vim-surround'

" vim-polyglot
Plug 'sheerun/vim-polyglot'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-css', 'coc-eslint', 'coc-html', 'coc-json',
\ 'coc-lists', 'coc-pairs', 'coc-prettier', 'coc-python', 'coc-tsserver',
\ 'coc-yaml']

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



""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc config
""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch-8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>\<CR>" : "\<C-g>u\<CR>"
else
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  inoremap <expr> <cr> pumvisible() && !empty(v:completed_item) ? "\<C-y>\<CR>" : "\<C-g>u\<CR>"
    " inoremap <cr> <C-y>
  " else
    " inoremap <cr> <C-g>u<CR>
  " endif
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>y  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
