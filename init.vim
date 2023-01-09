" Key bindings can be changed, see below
call wilder#setup({'modes': [':', '/', '?']})

" 'border'            : 'single', 'double', 'rounded' or 'solid'
"                     : can also be a list of 8 characters,
"                     : see :h wilder#popupmenu_border_theme() for more details
" 'highlights.border' : highlight to use for the border`
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \ },
      \ 'border': 'rounded',
      \ })))

" Theme
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

" Set status line colors
hi statusline ctermbg=61 ctermfg=White
" Set status line colors for Neovide
hi statusline guibg=#5F5FAF guifg=White

" Color groups for status lines"
hi User1 ctermbg=61 ctermfg=Black
hi User2 ctermbg=61 ctermfg=White

" Color groups for status lines for Neovide
hi User1 guibg=#5F5FAF guifg=Black
hi User2 guibg=#5F5FAF guifg=White

" Status text
fun! GetPaddingSpaces(s)
  let w = winwidth('%')
  let width = &modified ? w - 1: w
  let padding = (width - len(a:s)) / 2
  return repeat('\ ', padding)
endfun

fun! GetStatus()
  let sign = &modified ? '*' : ''
  let lineNumber= repeat('1', len(printf('%i', getline('.'))))
  let columnNumber = repeat('1', len(printf('%i', virtcol('.'))))
  let fullPath = fnameescape(pathshorten(expand('%:p:h')))
  let filename = fnameescape(expand('%:t'))
  let path = fullPath.'/'.filename.':'.lineNumber.':'.columnNumber
  let spaces = GetPaddingSpaces(path)
  " Show file encoding on status line
  "let s = 'set statusline=%2*'.sign.spaces.'%1*'.fullPath.'/%2*'.filename.'%1*:%l'."%=%2*%{''.(&fenc!=''?&fenc:&enc).''}"
  let s = 'set statusline=%2*'.sign.spaces.'%1*'.fullPath.'/%2*'.filename.'%1*:%l:%2*%c'
  exec s
endfun

autocmd CursorMovedI * call GetStatus()
autocmd BufWritePost * call GetStatus()
autocmd BufRead,BufNewFile * call GetStatus()
autocmd! BufRead,BufNewFile * call GetStatus()
autocmd! BufEnter * call GetStatus()
autocmd VimEnter * call GetStatus()

" In visual mode, use Y to copy to system clipboard
vnoremap Y "*y

" In normal mode, do the same with the current line
nnoremap Y "*yy

" vv = V
nnoremap vv V

" yank also copy to system  pasteboad
set clipboard=unnamed

" yank also copy to system clipboard for Ubuntu
set clipboard=unnamedplus

" Easy way for ^, $
nnoremap <silent> e ^
vnoremap <silent> e ^
nnoremap <silent> r $
vnoremap <silent> r $
nnoremap <silent> t 0
vnoremap <silent> t 0
nnoremap <silent> s e

" gg, GG shortcuts
noremap <silent> <nowait> G GG

" New line
nmap <CR> o<Esc>i
