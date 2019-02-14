" =============================================================================
" .vimrc
" Junhyeok Ahn ( junhyeokahn91@gmail.com )
" =============================================================================

" =============================================================================
" Plugin Setting
" =============================================================================
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
syntax on
set ruler
set bs=indent,eol,start
set autoindent
set smartindent
set pastetoggle=<F8>
set nowrap
set textwidth=0
"set cursorline
"set lazyredraw
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showtabline=1
set scrolloff=3
set ignorecase
set smartcase
set incsearch
set hlsearch
set expandtab
set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp,*.swo,*.class
set mouse=a
set ttymouse=xterm2
set noswapfile
set nobackup
set list
set listchars=tab:»\ ,trail:·,extends:>,precedes:<
set clipboard=unnamed

let mapleader=','
let maplocalleader=','
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>e :e %:h
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" =============================================================================
" Plugins
" =============================================================================
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-slash'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vim-scripts/a.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'qpkorr/vim-bufkill'
Plug 'yegappan/grep'
Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/clever-f.vim'
Plug 'majutsushi/tagbar'
Plug 'hdima/python-syntax'
Plug 'lervag/vimtex'
Plug 'junegunn/vim-journal'
Plug 'junegunn/goyo.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-surround'
Plug 'maralla/completor.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'davidhalter/jedi-vim'
Plug 'rhysd/vim-grammarous'
Plug 'junhyeokahn/vim-xmark', { 'do': 'make' }
Plug 'tpope/vim-eunuch'
Plug 'machakann/vim-highlightedyank'
Plug 'rhysd/vim-clang-format'
call plug#end()


" =============================================================================
" Plugin Setting
" =============================================================================
" 0. General
let Grep_Default_Options='-rn'
nnoremap <silent> <F3> :Rgrep<CR>
nnoremap <silent> <c-p> :FZF<CR>

nnoremap <silent> <F9> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {}
let g:easy_align_delimiters['d'] = {
\ 'pattern': ' \ze\S\+\s*[;=]',
\ 'left_margin': 0, 'right_margin': 0
\ }

let g:table_mode_header_fillchar='='

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" 1. Coloer Scheme
let g:seoul256_background=237
colo seoul256
let g:airline_theme='zenburn'
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

set laststatus=2
highlight CursorLine cterm=none

" 2. C,C++
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_experimental_template_highlight=1
let g:cpp_concepts_highlight=1
map <A-]> :vsp <CR> <C-w>l:exec("tag ".expand("<cword>"))<CR>

" 3. Python
let g:completor_python_binary='python'
let python_highlight_all=1
let g:jedi#popup_on_dot=0
let g:jedi#completions_enabled=0
let g:jedi#show_call_signatures=0

" 4. Latex
let g:vimtex_compiler_latexmk={'callback':0, 'continuous':0}
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_view_method='skim'
let g:vimtex_fold_manual=1
let g:vimtex_matchparen_enabled=1
let g:vimtex_indent_enabled = 0

" 5. Filetype
au BufNewFile,BufRead *.txt set filetype=journal
au BufNewFile,BufRead CMakeLists.txt set filetype=cmake
au BufNewFile,BufRead *.urdf set filetype=xml
hi link markdownItalic Normal

" 6. Grammarous
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 0,
            \ }
let g:grammarous#disabled_rules = {
            \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE'],
            \ }
let g:grammarous#show_first_error=0
let g:grammarous#hooks = {}
nnoremap <Leader>g :GrammarousCheck<CR>
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
    nmap <buffer><C-f> <Plug>(grammarous-fixit)
    nmap <buffer><C-g> <Plug>(grammarous-disable-rule)
    nmap <buffer><C-i> <Plug>(grammarous-open-info-window)
    nmap <buffer><C-r> <Plug>(grammarous-reset)
endfunction
function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nunmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
    nunmap <buffer><C-f> <Plug>(grammarous-fixit)
    nunmap <buffer><C-g> <Plug>(grammarous-disable-rule)
    nunmap <buffer><C-i> <Plug>(grammarous-open-info-window)
    nunmap <buffer><C-r> <Plug>(grammarous-reset)
endfunction

" 7. Clang Format
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp,objc ClangFormatAutoEnable
nmap <Leader>C :ClangFormatAutoToggle<CR>
