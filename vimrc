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
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"NerdTree settings"
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"vim-powerline status"
let g:Powerline_symbols = 'fancy'

syntax enable
colorscheme monokai
set number


