set nocompatible     " don't bother with vi compatibility
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf'
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
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :FZF<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :StripWhitespace<CR>
nmap <leader>g :ToggleGitGutter<CR>
nmap <leader>hl :let @/ = ""<CR>
nnoremap <leader>y :YRShow<cr>
inoremap {<CR> {<CR>}<Esc>O
nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``
nnoremap <silent> <leader>a :ArgWrap<CR>

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
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:airline_powerline_fonts = 1
let g:go_fmt_autosave = 0
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
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
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["css"] }
let g:syntastic_html_tidy_ignore_errors = [ 'trimming empty' ]
let g:github_user = 'oliversong'
let g:github_comment_open_browser = 1
let g:loaded_AlignMapsPlugin = 1 " short circuit alignmaps which screws up leader t

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
