" vim: set filetype=vim.eruby:

" Don't try to be vi compatible
set nocompatible

" no swap files
set noswapfile

" timeout lenght
set timeoutlen=1000
set ttimeoutlen=50

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Jump to new split
set splitbelow
set splitright

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Pick a leader key
let mapleader = ","

" Modelines
set modeline
set modelines=1

" Show line numbers
set number
set relativenumber

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=80
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Yank till end of line
nnoremap Y y$

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'terryma/vim-multiple-cursors'
  Plug 'terryma/vim-expand-region'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'preservim/nerdtree'
  Plug 'morhetz/gruvbox'

call plug#end()

" Color scheme (terminal)
set t_Co=256
set background=dark
colorscheme gruvbox

" Vimwiki
nmap <leader>dd <Plug>VimwikiMakeTomorrowDiaryNote
nmap <leader>pd <Plug>VimwikiDiaryPrevDay
nmap <leader>nd <Plug>VimwikiDiaryNextDay
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]

" Nerdtree
nnoremap <leader>nn :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" fuzzy find fzf with vim.fzf
nnoremap ff :FZF<CR>

" Ripgrep hidden files with vim.fzf
command! -bang -nargs=* Rg call fzf#vim#grep('rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

