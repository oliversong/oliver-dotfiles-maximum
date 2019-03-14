if has('python3')
  silent! python3 1
endif

set nocompatible     " don't bother with vi compatibility
filetype off

let g:vundle_default_git_proto = 'git'
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf'
Plugin 'wincent/command-t'
Plugin 'vim-scripts/Align'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'bkad/CamelCaseMotion'
Plugin 'tpope/vim-endwise' " endwise must come after delimitMate
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tomasr/molokai'
Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'garbas/vim-snipmate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-vividchalk'
Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'vim-scripts/gitignore'
Plugin 'terryma/vim-expand-region'
Plugin 'mattn/webapi-vim'
Plugin 'mmozuras/vim-github-comment'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/CursorLineCurrentWindow'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'FooSoft/vim-argwrap'
Plugin 'leafgarland/typescript-vim'
Plugin 'prettier/vim-prettier'
Plugin 'jparise/vim-graphql'
Plugin 'zhou13/vim-easyescape'
Plugin 'rhysd/conflict-marker.vim'

call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

" macvim settings
set guioptions-=r
set guioptions-=L
set guifont=Monaco\ for\ Powerline:h12

" set background color based on time of day, dark beginning at 6pm
if strftime("%H") < 18 && strftime("%H") > 6
  set background=light
else
  set background=dark
endif

" enable syntax highlighting
syntax enable

set smartindent
set autoindent
set autoread       " reload files when changed on disk, i.e. via `git checkout`
set backspace=2    " Fix broken backspace in some setups
set backupcopy=yes " see :help crontab
set clipboard=unnamed " yank an paste with the system clipboard
set directory-=.   " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab      " expand tabs to spaces
set ignorecase     " case-insensitive search
" set incsearch      " search as you type
set hlsearch
set laststatus=2   " always show statusline
set list           " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number         " show line numbers
set ruler          " show where you are
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set scrolloff=3    " show context above/below cursorline
set shiftwidth=2   " normal mode indentation commands use 2 spaces
set showcmd
set smartcase      " case-sensitive search if any caps
set softtabstop=2  " insert mode tab and backspace use 2 spaces
set tabstop=8      " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,packages/**,*.pyc,**/site-packages/*,**/env/*
set wildmenu       " show a navigable menu for tab completion
set wildmode=longest,list,full
set mouse=a
set relativenumber
set number
set colorcolumn=76

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevelstart=99   "dont start with closed folds

" keyboard shortcuts
let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
imap OD <left>
imap OA <up>
imap OC <right>
imap OB <down>
map <leader>l :Align
nmap <leader>a :Ag --smart-case 
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>
nmap <leader>f :FZF<CR>
nmap <leader>t :CommandT<CR>
nmap <leader>T :CommandTFlush<CR>:CommandT<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :StripWhitespace<CR>
nmap <leader>g :ToggleGitGutter<CR>
nmap <leader>hl :let @/ = ""<CR>
nmap <leader>gd :YcmCompleter GoTo<CR>
nmap <leader>gr :YcmCompleter GoToReferences<CR>
nmap <leader>gh :YcmCompleter GetType<CR>
nmap <leader>m :lopen<CR>
nnoremap <leader>y :YRShow<cr>
inoremap {<CR> {<CR>}<Esc>O
nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``
nnoremap <silent> <leader>a :ArgWrap<CR>
" mappings for moving lines up and down
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" configure camelcasemotion to overwrite w b e keys
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" markdown previews in Marked.app
function! s:setupMarkup()
  nnoremap <leader>md :silent !open -a Marked.app '%:p'<cr>
endfunction

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufRead,BufNewFile *.json set filetype=json

" plugin settings
let g:CommandTMaxHeight=20
let g:CommandTFileScanner='git'
let g:CommandTRecursiveMatch=0
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 1
let g:ackprg = 'ag --nogroup --nocolor --column --skip-vcs-ignores'
let g:ag_prg = 'ag --nogroup --nocolor --column --skip-vcs-ignores'
let g:airline_powerline_fonts = 1
" configure go
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
  \ 'goimports': ' -w -local samsaradev.io',
  \ }
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
" let g:go_list_type = "quickfix"
autocmd FileType go setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2|setlocal noexpandtab
autocmd FileType go compiler go
autocmd FileType go nmap <leader>gd :GoDef<CR>
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_max_num_candidates = 5
let g:ycm_max_num_identifier_candidates = 5
let g:ycm_complete_in_strings = 0
set completeopt-=preview
let g:JSHintUpdateWriteOnly=1
let g:jsx_ext_required = 1
let g:used_javascript_libs = 'jquery,underscore,backbone,react,flux,requirejs,jasmine'
let NERDTreeShowHidden=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_exec = 'eslint'
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["css", "typescript", "go"] }
let g:syntastic_html_tidy_ignore_errors = [ 'trimming empty' ]

let g:github_user = 'oliversong'
let g:github_comment_open_browser = 1
let g:loaded_AlignMapsPlugin = 1 " short circuit alignmaps which screws up leader t
" prettier autosave
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md Prettier

augroup vimrc_autocmd
  autocmd!

  " set up SyntaxComplete
  if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
          \ if &omnifunc == "" |
          \   setlocal omnifunc=syntaxcomplete#Complete |
          \ endif
  endif

  " fdoc is yaml
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
  " md is markdown
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  " automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
augroup END

" vim-expand-region map to v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set nocursorline " don't highlight current line
set t_Co=256
colorscheme solarized
set cursorline
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
inoremap <special> <Esc> <Esc>kj
set scrolljump=5

xmap \\  <Plug>Commentary<CR>
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine<CR>
nmap \\u <Plug>CommentaryUndo<CR>

set laststatus=2

" Broken down into easily includeable segments
let g:airline_section_b = '%t'
let g:airline_section_c = '%f'
let g:airline_section_x = ''
let g:airline_section_y = '%Y'
let g:airline_skip_empty_sections = 1
"set statusline+=\ [%{&ff}/%Y]            " filetype
"set statusline+=\ [%{getcwd()}]          " current dir
"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" keyboard shortcuts
let g:easyescape_chars = { "j": 2 }
let g:easyescape_timeout = 2000
cnoremap jj <ESC>

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
