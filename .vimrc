"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cormacrelf/vim-colors-github'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mg979/vim-visual-multi'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let maplocalleader = ","
set updatetime=300
set timeoutlen=1000 ttimeoutlen=50
set history=1000
set undofile
set undolevels=100
set undoreload=1000
set nobackup
set nowritebackup
set noundofile
set nowrap
set noswapfile

" interface
set so=8
set relativenumber
set signcolumn=yes

" completion
set cmdheight=1
set pumheight=8
set completeopt=menuone,noinsert,noselect

" clipboard
set clipboard^=unnamed,unnamedplus

" last line history
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap <C-h> <Left>
noremap <C-j> <Down>
noremap <C-k> <Up>
noremap <C-l> <Right>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=light
let g:github_colors_soft = 1
colorscheme github

call github_colors#togglebg_map('<f5>')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FloatTerm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set floaterm window's background to #FFFFFF
hi Floaterm guibg=#FFFFFF
" Set floating window border line color to #FFFFFF, and background to #FFFFFF
hi FloatermBorder guibg=#FFFFFF guifg=#090063

let g:floaterm_opener = "tabe"
let g:floaterm_autoclose = 2
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_complete_options = {'shortcut': 'floaterm', 'priority': 5, 'filter_length': [5, 20]}
nnoremap <silent> <leader>d :FloatermNew nnn -de<cr>
nnoremap <silent> <leader>r :FloatermNew rg<cr>
nnoremap <silent> <leader>g :FloatermNew lazygit<cr>
nnoremap <silent> <leader>f :FloatermNew fzf<cr>
nnoremap <silent> <leader>k :FloatermNew k9s<cr>
nnoremap <silent> <leader>z :FloatermToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Multi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VM_leader = '\'
let g:VM_theme = "lightblue1"
let g:VM_maps = {}
let g:VM_maps["Select All"]        = '<leader>a'
let g:VM_maps["Visual All"]        = '<leader>a'
let g:VM_maps["Align"]             = '<leader>A'
let g:VM_maps["Add Cursor Down"]   = '<C-j>'
let g:VM_maps["Add Cursor Up"]     = '<C-k>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = "github"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_max_signs=1000
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_set_sign_backgrounds = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mark Down Preview Server
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_port = 3333

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=c

" Use <Tab> to trigger completion.
inoremap <silent><expr> <Tab> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inorem<SID>check_ap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
