" set up pathogen, https://github.com/tpope/vim-pathogen
filetype off
call pathogen#infect()

" don't bother with vi compatibility
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'

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
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,packages/**,*.pyc
set wildmenu       " show a navigable menu for tab completion
set wildmode=longest,list,full
set mouse=a
set relativenumber
set number

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
nmap <leader>b :CommandTBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CommandT<CR>
nmap <leader>T :CommandTFlush<CR>:CommandT<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :ToggleGitGutter<CR>
nmap <leader>hl :let @/ = ""<CR>

" configure camelcasemotion to overwrite w b e keys
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" markdown previews in Marked.app
function! s:setupMarkup()
  nnoremap <leader>md :silent !open -a Marked.app '%:p'<cr>
endfunction

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufRead,BufNewFile *.json set filetype=json

" plugin settings
let g:CommandTMaxHeight=20
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:airline_powerline_fonts = 1
let g:go_fmt_autosave = 0
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview
let g:JSHintUpdateWriteOnly=1
let g:jsx_ext_required = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["css", "python"] }
let g:syntastic_html_tidy_ignore_errors = [ 'trimming empty' ]
" let g:syntastic_html_tidy_args = '--show-warnings false'

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

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
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif
