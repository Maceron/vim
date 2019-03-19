" This assumes your .vimrc is in ~/ and you cloned this repo as ~/vim/
" You can choose your plugins by editing ~/vim/plugins.vim
" I have included these:
"   vim-surround (stuff like automatically surround block with brackets/tokens)
"     https://github.com/tpope/vim-surround
"   vim-eunuch (execute UNIX shell commands inside vim, eg :Chmod :SudoEdit :Move :CFind)
"     https://github.com/tpope/vim-eunuch
"   vim-multiple-cursors (take simulatenous action at multiple positions)
"     https://github.com/terryma/vim-multiple-cursors#quick-start
"   fzf and fzf.vim (amazing fuzzy searching and beyond)
"     https://github.com/junegunn/fzf.vim

" To install vim-plug and the chosen plugins
" There was a way to run this automatically whenever you run vim, but I ran into bugs eg. permissions on prod

" So run this manually as sudo:
  " sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Then uncomment these 2 lines and open vim as sudo, watch it install, then comment these again:
  " so ~/vim/plugins.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

" show line numbers
set number

" indent with two spaces by default
set expandtab
set tabstop=2
set softtabstop=2
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
