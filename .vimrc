set encoding=utf-8

if !has('gui_running')
  map "in Insert mode, type Ctrl+v Alt+n here" <A-n>
endif

if has('win32')
        call plug#begin('~/.vim/plugged')
endif
if has('unix')
        call plug#begin('~/.vim/plugged')
endif

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Navigation in-file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Undo tree
Plug 'mbbill/undotree'

" Nerdtree
Plug 'preservim/nerdtree'

" THEME
Plug 'cormacrelf/vim-colors-github'

" YCM
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --go-completer --ts-completer' }

" Multi Cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Vim Proc
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Terraform
Plug 'hashivim/vim-terraform'

" Commentary
Plug 'tpope/vim-commentary'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" provide hjkl movements in Insert mode and Command-line mode via the <Alt> modifier key
noremap! <C-h> <Left>
noremap! <C-j> <Down>
noremap! <C-k> <Up>
noremap! <C-l> <Right>

" map leader key
let mapleader = ","
let maplocalleader = ","

" ESC delay
set timeoutlen=1000 ttimeoutlen=0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" set copy & paste
set clipboard=unnamed
set cursorline
set nocompatible

" Relative line number with absolute number of the current line
set number relativenumber

" Sets how many lines of history VIM has to remember
set history=300

" Set to auto read when a file is changed from the outside
set autoread

" Disable Sound
set belloff=all

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch
" nnoremap <esc> :noh<return><esc>


" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Indent symbol
" set listchars=tab:\\ 
" set list

" File Detect
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

" Folding section
set foldmethod=syntax   
set foldnestmax=1
set nofoldenable
set foldlevel=2

" Add a bit extra margin to the left
set foldcolumn=2

" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use a slightly darker background, like GitHub inline code blocks
let g:github_colors_soft = 1

" use the dark theme
set background=light

" more blocky diff markers in signcolumn (e.g. GitGutter)
let g:github_colors_block_diffmark = 0

" Color scheme
colorscheme github

" if you use airline / lightline
let g:airline_theme = "github"
let g:lightline = { 'colorscheme': 'github' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintain undo history between sessions
if has('win32')
    set undodir=~/.vim/undodir    " Dir to save undo info for Windows
endif

if has('unix')
    set undodir=~/.vim/undodir  " Dir to save undo info for Linux
endif
nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
nnoremap <leader>nf :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
set undofile                       " Enable undo
set undolevels=100                 " How many undos
set undoreload=1000                " Number of lines to save for undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>r :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 

" Smart Case
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(blue)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => You Complete Me
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gf :YcmCompleter FixIt<CR>

let g:ycm_auto_hover=''
let s:ycm_hover_popup = -1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_max_num_candidates = 13
let g:ycm_max_num_identifier_candidates = 13
let g:ycm_auto_trigger = 2
let g:ycm_show_diagnostics_ui = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 0
let g:ycm_allow_changing_updatetime = 0
let g:ycm_disable_for_files_larger_than_kb = 300

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terraform Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
