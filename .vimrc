" highlight current cursor line, with a notch after column 80
" set cursorline
" set colorcolumn=81

" show line numbers
set number

" indent with two spaces by default
set expandtab
set tabstop=2
set softtabstop=0 " disable
set shiftwidth=0 " when zero, the tabstop value is used

" colors
set background=dark
syntax on
highlight Comment ctermfg=green

" show invisible chars
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:·
" set list

" setup toggles
nnoremap <F2> :set number!<CR>
nnoremap <F3> :set list!<CR>
nnoremap <F4> :set cursorline!<CR>
nnoremap <F5> :let &cc = &cc == '' ? '81' : ''<CR>

" highlight trailing whitespace in red
" have this highlighting not appear whilst you are typing in insert mode
" have the highlighting of whitespace apply when you open new buffers
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" set window title to open file
let &titlestring = $USER . "@" . hostname() . " " . expand("%:p")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

let &titleold= $USER . "@" . hostname() . " " . getcwd()
"autocmd BufWinLeave * set titleold
