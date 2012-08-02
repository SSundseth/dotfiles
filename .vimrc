"****************************************
" Pathogen ftw!
"****************************************
call pathogen#infect()                  " load plugins
syntax on                               " highlight based on syntax
filetype plugin on                      " use plugins
filetype indent on                      " indent based on filetype


"****************************************
" Window settings
"****************************************
set number!                             " show line numbers
set wrap                                " wrap text
set whichwrap+=<,>,h,l                  " move to next line in command-mode
set cmdheight=2                         " command bar two lines high
set laststatus=2                        " status bar more visible
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set showmatch                           " highlight matching parentheses
set hlsearch                            " highlight search hits
set incsearch                           " move the cursor to first search hit
set backspace=eol,start,indent          " backspace detects indentation
color candycode                         " 1337 h4x
set hidden                              " hide abandoned buffers


"****************************************
" Tab and Indent Settings
"****************************************
set autoindent                          " copy indent from previous line
set smartindent                         " indent based on filetype
set smarttab                            " number of tabs equals number of indents
set expandtab                           " tabs are spaces
set shiftwidth=2                        " indent two spaces
set tabstop=2                           " tabs are worth two spaces


"****************************************
" Miscellaneous settings
"****************************************
set visualbell                          " no error sounds
set autoread                            " read a file changed outside of vim
set viminfo='10,\"100,:20,%,n~/.viminfo


"****************************************
" Keep tmp files in a safe place
"****************************************
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp


"****************************************
" GUI preferences
"****************************************
if has("gui_running")
  set guifont=Monaco:h14                " better font, better size
  set lines=100 columns=300             " fill the screen
  set guioptions-=T                     " no toolbar
endif


"****************************************
" Useful mappings
"****************************************
let mapleader = ","
map <leader>n :NERDTreeToggle<CR>
map <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <leader>b :FufBuffer<CR>
nmap <tab> <C-w>w
nmap <C-tab> <C-w>h
nnoremap <C-h> :set hlsearch!<CR>


"****************************************
" Map commands that might be capitalized
"****************************************
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang WA wa<bang>
command! -bang Wa wa<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>


"****************************************
" Autocommands
"****************************************
au BufWritePre * call TrimWhiteSpace()  " remove whitespace before saving
augroup resCur                          " return cursor to previous position
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup ENDif


"****************************************
" Functions
"****************************************
function TrimWhiteSpace()               " removes whitespace from the end of
  let save_cursor = getpos(".")         " every line and all blank lines at the
  :silent! %s#\($\n\s*\)\+\%$##         " end of the file
  :silent! %s/\s\+$// | w
  call setpos(".", save_cursor)
endfunction

function! ResCur()                      " save the cursor's position
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
