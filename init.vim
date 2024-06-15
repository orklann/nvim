" Key bindings can be changed, see below
" call wilder#setup({'modes': [':', '/', '?']})
"call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      "\ 'highlights': {
      "\   'border': 'Normal',
      "\ },
      "\ 'border': 'rounded',
      "\ })))

" Theme
set termguicolors

set nonu

cabbrev t tabnew
cabbrev tn tabnext
cabbrev tp tabprevious

map <c-u> :tabprevious<CR>
imap <c-u> <ESC>:tabprevious<CR>
map <c-i> :tabnext<CR>
imap <c-i> <ESC>:tabnext<CR>
map <c-j> <c-f>
map <c-k> <c-b>

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

" Delete word backward
nnoremap dw bdw

" Old status line theme
" Color groups for status lines for Neovide
"hi User1 guibg=#5F5FAF guifg=Black
"hi User2 guibg=#5F5FAF guifg=White

hi User1 guifg=#5F5FAF
"hi User2 guibg=#5F5FAF guifg=White

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
  "let fullPath = fnameescape(pathshorten(expand('%:p:h')))
  let filename = fnameescape(expand('%:t'))
  "let path = fullPath.'/'.filename.':'.lineNumber.':'.columnNumber
  "
  let fullPath = ""
  let path="[*Tommy*]".filename.":%1:%c"
  let spaces = GetPaddingSpaces(path)
  " Old status line
  "let s = 'set statusline=%2*'.sign.spaces.'%1*'.fullPath.'/%2*'.filename.'%1*:%l:%2*%c'
  let s = 'set statusline=%2*'.sign.spaces.'%1*'."[*Tommy*]".'%1*'.filename.'%1*:%l:%1*%c'
  exec s
endfun

autocmd CursorMoved * call GetStatus()
autocmd BufWritePost * call GetStatus()
autocmd BufRead,BufNewFile * call GetStatus()
autocmd! BufRead,BufNewFile * call GetStatus()
autocmd! BufEnter * call GetStatus()
autocmd VimEnter * call GetStatus()

" Change to current directory which contains new file
fun! CWD()
    let fullPath = expand('%:p:h')
    let s = "cd ".fullPath
    exec s
endfun

autocmd BufRead,BufNewFile * call CWD()
autocmd! BufRead,BufNewFile * call CWD()
autocmd! BufEnter * call CWD()

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

" Hide coloration of found words
map <C-C> :nohlsearch<CR>

call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" snippy
Plug 'dcampos/nvim-snippy'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'


" cscope.nvim
Plug 'mfulz/cscope.nvim'

call plug#end()

set completeopt=menu,menuone,noselect

" Source configurations
source ~/.config/nvim/vim/colorizer.vim
source ~/.config/nvim/vim/nvim-cmp.vim
source ~/.config/nvim/vim/cscope.vim
source ~/.config/nvim/vim/snippy.vim

" Disable mouse
set mouse=

" Tabline colors
hi TabLineSel guifg=white guibg=#5F5FAF

" Wrap text to textwidth: set textwidth=80, and use this command
nmap <C-L> gqG

" Set tabs for cosmopolitan
au BufRead,BufNewFile,BufEnter /home/rkt/projects/cosmopolitan/* setlocal ts=2 sts=2 sw=2
