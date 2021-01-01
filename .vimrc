"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cormacrelf/vim-colors-github'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mg979/vim-visual-multi'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let maplocalleader = ","
set updatetime=100
set timeoutlen=1300 ttimeoutlen=80
set history=500
set undofile
set undolevels=30
set undoreload=500
set nobackup
set nowb
set nowrap
set noswapfile

" interface
set so=5
set relativenumber
set signcolumn=yes

" folding
set foldmethod=indent
set foldnestmax=2
set nofoldenable
set foldlevel=2

" completion
set cmdheight=1
set pumheight=8
set completeopt-=preview

" last line history
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap! <C-h> <Left>
noremap! <C-j> <Down>
noremap! <C-k> <Up>
noremap! <C-l> <Right>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NVIM Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard^=unnamed,unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

let g:github_colors_soft = 1

set background=dark

colorscheme github

let g:airline_theme = "github"

call github_colors#togglebg_map('<f5>')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Multi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VM_leader="\\"
let g:VM_theme = 'lightblue1'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi GitGutterAddLineNr          guibg=#DEFFCD guifg=#505050 ctermfg=2
hi GitGutterChangeLineNr       guibg=#FBFFCD guifg=#505050 ctermfg=3
hi GitGutterDeleteLineNr       guibg=#FFD8CB guifg=#505050 ctermfg=1
hi GitGutterChangeDeleteLineNr guibg=#FBFFCD guifg=#505050 ctermfg=3
hi GitGutterAdd				   			 guibg=#B4FFB2 guifg=#505050 ctermfg=2
hi GitGutterChange						 guibg=#F9FFB2 guifg=#505050 ctermfg=3
hi GitGutterDelete 			   		 guibg=#FFBBA6 guifg=#505050 ctermfg=1
hi GitGutterChangeDeleteLine   guibg=#F9FFB2 guifg=#505050 ctermfg=3

let g:gitgutter_max_signs=300
let g:gitgutter_signs = 1
let g:gitgutter_set_sign_backgrounds = 0
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
nnoremap <leader>nf :NERDTreeFind<cr>

let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules', 'vendor']
let g:NERDTreeStatusline = ''

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType nerdtree setlocal signcolumn=no

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -r'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>r :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>h :History<CR>

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column -n --no-heading -p --color=always --fixed-strings --follow --smart-case --glob '!{.git,node_modules,vendor}/*' -s ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=c
let g:coc_global_extensions = [
            \'coc-tsserver',
            \'coc-clangd',
            \'coc-python',
            \'coc-go',
            \'coc-emmet',
            \'coc-html',
            \'coc-css',
            \'coc-json',
            \'coc-docker',
            \'coc-markdownlint',
            \'coc-sh',
            \'coc-vetur',
            \]

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

nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inorem<SID>check_ap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader> ac <Plug>(coc-codeaction)
nmap <leader> qf <Plug>(coc-fix-current)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
