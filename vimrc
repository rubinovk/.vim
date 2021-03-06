"+++++++++++++++++++++++++++
"Konstantin Rubinov's .vimrc
"+++++++++++++++++++++++++++

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'XPTemplate')
call add(g:pathogen_disabled, 'LatexFormatter')
call add(g:pathogen_disabled, 'vim-space') " it messes up some bindings :(

" Invoke pathogen plugin
call pathogen#infect()
call pathogen#helptags()

" Hide toolbar on MacVim
if has("gui_running")
    set guioptions-=T
endif 

if has('mac')
    "see help tips: h xterm-screens
    set t_ti= t_te=
elseif has('unix')
    " put what's necessary
endif

set nocompatible

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

let mapleader = ","
let maplocalleader = ","

" set autowrite for actions
set autowrite

"keep Finder labels
set backupcopy=yes

" Automatically read a file that has changed on disk
set autoread

" Store swp files in the directory: % causes conflicts for files with same
" names
" set directory=~/.vim/swap

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

" Show “invisible” characters when
" 'set list!' is invoked
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_

" better tab experience in Vim's command line
set wildmenu
set wildignorecase
set wildignore+=*/tmp/*,*.so,*.swp

" When spell checking show only 15 suggestions
set spellsuggest=15

" Set up background and colorscheme for MacVim and terminal version
set t_Co=256
set background=dark
" Use vim-unimpared to quickly switch background 'cob'

syntax enable
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized


" " set transparency=0 "conflicts with terminal
" let g:zenburn_force_dark_Background=1
" "let g:zenburn_high_Contrast = 1
" let g:zenburn_old_Visual=1
" let g:nenburn_alternate_Visual=1
" " let g:zenburn_alternate_Include = 1
" " if has("gui_running") "not needed any more as 256 terminal is used
" " colorscheme solarized
" colorscheme zenburn
" " endif
" set guifont=Inconsolata:h14
set guifont=Monaco:h12

" Enable file type detection and do language-dependent indenting.
if has("autocmd")
    filetype plugin indent on
endif

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

"map Esc to shift+space; can also use ctrl+[
" :imap <S-Space> <Esc>
" Can be typed even faster than jj.
imap jk <Esc>

" try new change paste/replace experience word-wise
nmap <silent> cp "_cw<C-R>"<Esc>

" Yank text to the OS X clipboard
" noremap <leader>y "*y
" noremap <leader>yy "*Y
set clipboard=unnamed 

" window navigation
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>

" insert blank line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <C-CR> i<CR><Esc>

" To be able to undo these types of deletion in Insert mode.
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

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
" It's possible to use vim-unimpared to toggle wrapping

" setup autocompletion for i_CTRL_N/P
set cpt=.,w,b

"remap completion for file names
inoremap <c-f> <c-x><c-f>
"remap completion for lines in the file
inoremap <c-l> <c-x><c-l>

" set visual bell - disable the beeping
set vb

" set incsearch
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
" now can use vim-exchange plugin to swap pieces of code with cx command!


"========================== Setup Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!' 


"========================== Setup vim-session
" persist sessions when CMD+Q on Mac
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

"========================== Setup YankRing
" Y from cursor till the end of line
" nnoremap Y y$
" for behavior to be consistent remap Y through YankRing
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

"========================== Setup bufexplorer
" original shortcut for BufExp is ,be
noremap <silent> ,bb :BufExplorer<CR>
let g:bufExplorerDetailedHelp=1

"========================== Setup MRU shortcut
noremap <silent> ,f :MRU<CR>

"========================== Setup SCSS file type automatically
au BufRead,BufNewFile *.scss set filetype=scss

"========================== Setup SMT2 file type automatically
"
au BufRead,BufNewFile *.smt2 set filetype=smt-lib 

"========================== Setup Jimple file type automatically
au BufRead,BufNewFile *.jimple set filetype=java 

"========================== Setup Markdown to HTML
nmap <leader>md :%!/usr/local/bin/markdown --html4tags <cr>  

"========================== Setup Pandoc Markdown to PDF  
nmap <leader>pd :!pandoc % -o %.pdf <cr>  

"========================== shortcut for TComment toggle comment for selection
" somehow there's a delay for this mapping :(
map <leader>cc <c-_><c-_>
" Use secondary binding of plugin instead: <leader>__
" 
" Html comments for Markdown: 
call tcomment#DefineType('mkd', '<!-- %s --> ') 
call tcomment#DefineType('mkd_inline',      g:tcommentInlineXML)
call tcomment#DefineType('mkd_block',       g:tcommentBlockXML ) 

"========================== shortcut for NERDTree invocation
nmap <leader>nt :NERDTree<cr>
nmap <leader>nf :NERDTreeFind<cr>

"==========================  Mapping for Surround plugin shorcut
nmap s ys
vmap s S
" use proper latex quotes by calling: surround + '-'
autocmd FileType tex let b:surround_45 = "``\r''"

"=========================== setup for Latex-Box plugin
"
" instead of old setting option '-pvc'
let g:LatexBox_latexmk_preview_continuously = '1'
" Try to disable async to alleviate main file problem https://github.com/LaTeX-Box-Team/LaTeX-Box/issues/220
" let g:LatexBox_latexmk_async = '1'
let g:LatexBox_output_type = 'pdf'
let g:LatexBox_viewer = 'skim'
let g:LatexBox_quickfix = '0'
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>

" mapping to Close the last matching open environment
imap ]]	<Plug>LatexCloseCurEnv 
" Wrap the current selection in a LaTeX command. 
vmap ,W <Plug>LatexWrapSelection
" Wrap the current selection in an environment.
vmap ,We <Plug>LatexEnvWrapSelection


" map  <silent> <buffer> ¶ :call LatexBox_JumpToNextBraces(0)<CR>
" map  <silent> <buffer> § :call LatexBox_JumpToNextBraces(1)<CR>
" imap <silent> <buffer> ¶ <C-R>=LatexBox_JumpToNextBraces(0)<CR>
" imap <silent> <buffer> § <C-R>=LatexBox_JumpToNextBraces(1)<CR>


"========================== vim-abolish plugin
" see folder .vim/after/plugin/abolish.vim for abbreviations

" Vim markdown syntax highlighting plugin
let g:vim_markdown_folding_disabled=1

"========================== textobj-user plugin
" Latex objects are defined with textobj-user plugin:
" \command{} can be matched with ac and ic
" Old Definition is located in ./bundle/text-objects/plugin/latexobj.vim
" Definition is located in ./after/plugin/textobj/latexobj.vim


"========================== LanguageTool plugin
let g:languagetool_jar='/Applications/LanguageTool-2.2/languagetool-commandline.jar'

"========================== Syntax highlighting for LLVM
" Original Plugins are located in /Users/rubinovk/tools/LLVM/llvm-src/utils/vim

augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

augroup filetype
    au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" LLVM Makefile highlighting mode
augroup filetype
    au! BufRead,BufNewFile *Makefile*     set filetype=make
augroup END

"=== LLVM end

" Edit the vimrc file 
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

"========================== Printing with syntax highlighting
" Invoke as:
" :Hardcopy > /tmp/out.ps

" command! -nargs=* Hardcopy call DoMyPrint('<args>')
" function DoMyPrint(args)
"   let colorsave=g:colors_name
"   color print
"   exec 'hardcopy '.a:args
"   exec 'color '.colorsave
" endfunction


"========================== Russian keyboard mapping support 
" the problem is that mappings for commands don't work any more

" set keymap=russian-jcukenwin
set keymap=russian-jcukenmac
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"set langmap=йцукенгшщзхъфывапролджэячсмитьбю/ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ/;qwertyuiop\[\]asdfghjkl\;\'zxcvbnm\,\./QWERTYUIOP\{\}ASDFGHJKL\:\"/ZXCVBNM\<\>\?/
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"another solution to bluntly trigger eng layout when in normal mode
" this solution is slow and causes delay when entering command line or typing
" colon.
" imap :!setxkbmap us:!setxkbmap us,ru
" nmap :!setxkbmap us:!setxkbmap us,ru

"Bug that bothered seems to be known
"https://code.google.com/p/macvim/issues/detail?id=377&can=1&q=font
"http://blog.jjgod.org/2009/08/18/snow-leopard-vs-dell-lcd-displays/
"http://osxdaily.com/2012/06/09/mac-screen-blurry-optimize-troubleshoot-font-smoothing-os-x/
