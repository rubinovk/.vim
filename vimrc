"+++++++++++++++++++++++++++
"Konstantin Rubinov's .vimrc
"+++++++++++++++++++++++++++

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'XPTemplate')
call add(g:pathogen_disabled, 'LatexFormatter')
call add(g:pathogen_disabled, 'supertab')
call add(g:pathogen_disabled, 'vim-space') " it messes up some bindings :(

" Invoke pathogen plugin
call pathogen#infect()
call pathogen#helptags()

" Hide toolbar on MacVim
if has("gui_running")
    set guioptions-=T
endif 

set nocompatible

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

let mapleader = ","
let maplocalleader = ","

" set autowrite for actions
set autowrite

" Automatically read a file that has changed on disk
set autoread

" Store swp files in the directory:
set directory=~/.vim/swap

" use ; for entering commands Caution: it won't work for open hit-enter
" dialogs, as in :ls
nnoremap ; :
" map spacebar to colon
"nmap <space> :

"show line numbers
set number
"show command in the right low corner
set showcmd

" Switch syntax highlighting on
syntax on

" When spell checking show only 15 suggestions
set spellsuggest=15

" Set up background and colorscheme for MacVim and terminal version
set t_Co=256
set background=dark
" set transparency=0 "conflicts with terminal
let g:zenburn_force_dark_Background=1
"let g:zenburn_high_Contrast = 1
let g:zenburn_old_Visual=1
let g:nenburn_alternate_Visual=1
" let g:zenburn_alternate_Include = 1
" if has("gui_running") "not needed any more as 256 terminal is used
" colorscheme solarized
colorscheme zenburn
" endif
set guifont=Inconsolata:h14

" Enable file type detection and do language-dependent indenting.
if has("autocmd")
    filetype plugin indent on
endif

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

"map Esc to shift+space; can also use ctrl+[
" :imap <S-Space> <Esc>
" Can be typed even faster than jj.
:imap jk <Esc>
" Y from cursor till the end of line
:nnoremap Y y$

" window navigation
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>

" insert blank line
map <S-Enter> O<Esc>
map <CR> o<Esc>
nmap <C-CR> i<CR><Esc>

" easy navigation in wrapped lines
nnoremap j gj
nnoremap k gk

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqiw                       

"Allow to enter non-text areas
set virtualedit=all

" when doing cw have $ sign
set cpoptions+=$

" setup tab filled with spaces
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Wrap text
set wrap
set linebreak
set nolist  " list disables linebreak
" starts with spaces, beginning of the line \_^ has a \ followed by a keyword
" \k
" set flp="^\s*\\" 
" ^\s*\d\+[\]:.)}\t ]\s*\|

" setup automatic hard wrapping for a local buffer
" n is to recognize lists in text and do not format them. Lists are defined by 'flp'
noremap <silent> ,r :setlocal fo+=tan<CR>
" I don't know how to toggle multiple flags, so I use another command
noremap <silent> ,rw :setlocal fo-=tan<CR>
" command! -nargs=* Wrapon set fo+=tan 
" command! -nargs=* Wrapout set fo-=tan

" setup autocompletion for i_CTRL_N/P
set cpt=.,w,b

"remap completion for file names
:inoremap <c-f> <c-x><c-f>
"remap completion for lines in the file
:inoremap <c-l> <c-x><c-l>

" set visual bell - disable the beeping
set vb

" highlight search terms
set hlsearch

" fast search typing in the command line
" I just need to enter pattern and substitute
nnoremap ,/ :%s//g<Left><Left>
" noremap ;' :%s:::cg<Left><Left><Left><Left> 
" this one is slow because of my ; remap
" noremap ;; :%s:::g<Left><Left><Left>

" discard search highlight with esc
" nnoremap <esc> :noh<return><esc>
" this version doesn't make '.2c' to appear in terminal
nnoremap <silent> <C-l> :nohlsearch<CR>

" Faster delete buffer
noremap <silent> ,bd :bd<CR>

" Faster save
noremap <silent> ,w :w<CR>

" set the status line 
set stl=%t\ Buf:%n\ Line:%l/%L[%p%%]\ Col:%v

" display status line always
set laststatus=2

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Increase history from standard 20 to 100
set history=100

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`':noh<CR>


"========================== Setup MRU shortcut
map <leader>f :MRU<CR>

"========================== Setup SCSS file type automatically
au BufRead,BufNewFile *.scss set filetype=scss

"========================== Setup Markdown to HTML "Markdown to HTML  
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>  

"========================== shortcut for TComment toggle comment for selection
map <leader>c <c-_><c-_>

"========================== shortcut for NERDTree invocation
map <leader>nt :NERDTree<cr>

"==========================  Mapping for Surround plugin shorcut
nmap s ys
vmap s S
" use proper latex quotes by calling: surround + '-'
autocmd FileType tex let b:surround_45 = "``\r''"

"=========================== setup for Latex-Box plugin
let g:LatexBox_latexmk_options = '-pvc'
let g:LatexBox_output_type = 'pdf'
let g:LatexBox_viewer = 'skim'
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>

" mapping to Close the last matching open environment
" imap ]]	<Plug>LatexCloseCurEnv 

map  <silent> <buffer> ¶ :call LatexBox_JumpToNextBraces(0)<CR>
map  <silent> <buffer> § :call LatexBox_JumpToNextBraces(1)<CR>
imap <silent> <buffer> ¶ <C-R>=LatexBox_JumpToNextBraces(0)<CR>
imap <silent> <buffer> § <C-R>=LatexBox_JumpToNextBraces(1)<CR>

" Edit the vimrc file 
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

"Russian keyboard mapping support
set keymap=russian-jcukenwin
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"set langmap=йцукенгшщзхъфывапролджэячсмитьбю/ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ/;qwertyuiop\[\]asdfghjkl\;\'zxcvbnm\,\./QWERTYUIOP\{\}ASDFGHJKL\:\"/ZXCVBNM\<\>\?/
set iminsert=0
set imsearch=0

"Bug that bothered seems to be known
"https://code.google.com/p/macvim/issues/detail?id=377&can=1&q=font
"http://blog.jjgod.org/2009/08/18/snow-leopard-vs-dell-lcd-displays/
"http://osxdaily.com/2012/06/09/mac-screen-blurry-optimize-troubleshoot-font-smoothing-os-x/
