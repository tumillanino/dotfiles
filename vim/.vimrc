call plug#begin('~/.vim/plugged')

" LSP Plugins here
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

" feature  plugins here
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'

" Languages here
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'

" Extensions of other plugins
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'

" Other
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" NERDTree extensions 
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
call plug#end()

let mapleader = " "
let g:airline_theme='molokai'
let g:vim_markdown_toc_aurofit=1

set nocompatible          " Disable Vi compatibility
set number                " Show line numbers
set relativenumber        " Show relative line numbers
set tabstop=4             " Set tab width to 4 spaces
set shiftwidth=4          " Indent by 4 spaces
set expandtab             " Use spaces instead of tabs
set autoindent            " Auto-indent new lines
set smartindent           " Enable smart indentation
set hlsearch              " Highlight search matches
set incsearch             " Show search matches as you type
set ignorecase            " Ignore case in searches
set smartcase             " Override ignorecase if uppercase is used
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific plugins

"Prettier Settings
command -nargs=0 Prettier :CocCommand prettier.formatFile

set matchpairs+=<:>
set clipboard=unnamedplus
command! FindFiles execute "vsplit" | execute "term find . -type f | fzf"

" Custom Keybindings
" Insert Mode
inoremap jk <Esc>
inoremap <expr> <cr> coc#pum#visible() ? coc#oum#confirm() : "\<CR>"

"Prettier Formatting
vmap <leader>f <Plug>{coc-format-selected}
nmap <leader>f <Plug>{coc-format-selected}

" Paragraph Navigation
nnoremap [ }
nnoremap ] {

" Line Navigation
nnoremap 0 $
nnoremap 1 ^

" Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Save and Quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :wq<CR>

" Open Files
nnoremap <leader>o :e<Space>

" NERDTree Maps
nnoremap <leader>ee :NERDTreeToggle<CR>
