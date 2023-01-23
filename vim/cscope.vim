" Path to store the cscope files (cscope.files and cscope.out)
" Defaults to '~/.cscope'
let g:cscope_dir = '~/.nvim-cscope'

" Map the default keys on startup
" These keys are prefixed by CTRL+\ <cscope param>
" A.e.: CTRL+\ d for goto definition of word under cursor
" Defaults to off
let g:cscope_map_keys = 1

" Update the cscope files on startup of cscope.
" Defaults to off
" let g:cscope_update_on_start = 1

" Command alias for cscope
cabbrev csa cs find a 
cabbrev csc cs find c
cabbrev csd cs find d
cabbrev csg cs find g 
cabbrev csi cs find i
cabbrev css cs find s
