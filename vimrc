"Maintained by @kevthenewversi - github 
"
"   MAY THE 4th BE WITH YOU
"

" Exec  pathogen
execute pathogen#infect()

" Install vim-plug if it doesn't installed yet
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

"Monokai syntax highlighting
Plug 'crusoexia/vim-monokai'

"Syntax checker"
Plug 'vim-syntastic/syntastic'

"Chiel92 autoformat plugin"
Plug 'Chiel92/vim-autoformat'

"Auto-complete plugin"
Plug 'Valloric/YouCompleteMe'

"Status line plugin"
Plug 'Lokaltog/vim-powerline'

"NERD TREE"
Plug 'scrooloose/nerdtree'

"sorround plug for HTML"
Plug 'tpope/vim-surround'

"git diff on gutter plugin"
Plug 'airblade/vim-gitgutter'

"git wrapper"
Plug 'tpope/vim-fugitive'

"comment out code plugin'
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()

"Syntastic settings"
set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"NerdTree settings"
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.pyc$', 'node_modules', '\.git']
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeBookmarksFile = $HOME.'/.vim/.NERDTreeBookmarks'
let NERDTreeMapUpdir = 'h'
let NERDTreeMapChangeRoot = 'l'

"vim-powerline status"
let g:Powerline_symbols = 'fancy'

syntax enable
colorscheme monokai
set number

set norelativenumber

" Tab and indent
set autoindent
set shiftwidth=4 " The number of space characters that will be inserted when performing >> or <<
set softtabstop=4 " The number of space characters that will be inserted when the tab key is pressed,
set expandtab " Insert space characters whenever the tab key is pressed

" Status
set laststatus=2

" Use /g flag on :s substitutions by default
set gdefault

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch


" Allow vim to hide modified buffers without abandoning them
set hidden

" Don't redraw while executing macros (performance config)
set lazyredraw

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Keep n lines off the edges of the screen when scrolling
set scrolloff=5

"""""""""""
""" MAP
"""""""""""
"
" noremap  -> map normal and visual
" nnoremap -> map normal
" inoremap -> map insert

" Function keys
set pastetoggle=<F2>
map <F3> :setlocal spell! spelllang=en_us<CR>

" Disable keys
noremap Q <nop>
noremap K <nop>

" Fast moving
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Spacebar to save
nnoremap <space> :w<CR>

""""""""""""
""" MISC
""""""""""""

" Change .viminfo location
set viminfo+=n~/.vim/.viminfo

" Make vim save swapfiles, backups, and undofiles in .vim
" set swapfile
" set backup
" set undofile
" set directory=~/.vim/tmp//,.
" set backupdir=~/.vim/tmp//,.
" set undodir=~/.vim/tmp//,.
" Use this config if you don't want swapfiles and backups, at all
set nobackup
set noswapfile

" Disable .netrwhist
let g:netrw_dirhistmax = 0

" Stay in the same column when doing G motion
set nostartofline

" Don't increment in octal notation
set nrformats-=octal

" Folding style
highlight Folded cterm=bold
function! MyFoldText()
    let line = getline(v:foldstart)
    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart
    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - strdisplaywidth(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()

" Markdown configuration
augroup MarkdownConfiguration
    " autocmd BufNewFile,BufRead *.md Goyo 80
    autocmd BufNewFile,BufRead *.md set wrap
    autocmd BufNewFile,BufRead *.md set linebreak breakindent
    autocmd BufNewFile,BufRead *.md nnoremap j gj
    autocmd BufNewFile,BufRead *.md nnoremap k gk
augroup END
