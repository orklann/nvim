autocmd BufNewFile,BufRead *.m setfiletype objc
autocmd BufNewFile,BufRead *.h setfiletype objc
autocmd BufNewFile,BufRead *.m call deoplete#custom#option('auto_complete', v:true)
