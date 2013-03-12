if exists('g:loaded_textobj_latexobj')
  finish
endif


" Original pattern:
" '\\\w\+{.\{-}}'
"
" Actual pattern works with a pair of brackets!

call textobj#user#plugin('latexobj', {
\ 'command': {
\ '*pattern*': ['\\\w\+{', '}'],
\ 'select-a': 'aC',
\ 'select-i': 'iC',
\ },
\})

let loaded_textobj_latexobj = 1
