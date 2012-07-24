" Use filetype plugins
call pathogen#infect()
syntax on
filetype plugin on
filetype indent on

" Window settings
set number!
set ruler
set columns=84
set wrap
set cmdheight=2

" Highlight matching parentheses
set showmatch

" Search Settings
set autoindent
set smartindent

" No error sound
set visualbell

" Automatically read a file that is changed outside of Vim
set autoread

" Hide abandoned buffers
set hidden

" Sensible backspace
set backspace=eol,start,indent

" Move to next line
set whichwrap+=<,>,h,l

" Search settings
set hlsearch
set incsearch

" Tab settings
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2

" Place cursor at last position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal! g~\"" |
  \ endif

" Status line
set laststatus=2

" 1337 h4X
color candycode

" Mappings
let mapleader = ","
map <leader>n :NERDTreeToggle<CR>
map <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <leader>b :FufBuffer<CR>
nmap <tab> <C-w>w
nmap <C-tab> <C-w>h
nnoremap <F3> :set hlsearch!<CR>


" Keep tmp files in a safe place
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp

"GUI prefs
if has("gui_running")
  set guifont=Monaco:h14
  set lines=999 columns=84
endif

" Map commands that might accidentally be capitalized
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang WA wa<bang>
command! -bang Wa wa<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>

" Functions
function TrimWhiteSpace()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  :silent! %s/\s\+$// | w
  call setpos(".", save_cursor)
endfunction

" Remove whitespace before saving
au BufWritePre * call TrimWhiteSpace()
