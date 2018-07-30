setlocal ff=unix
set autoindent tabstop=2 shiftwidth=2 expandtab
colorscheme elflord
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" searching
set ignorecase    " search cast-insensitive
set smartcase     " ...unless there's a capital letter, then make it case sensitive
set incsearch     " search as you type
set hlsearch      " highlight search items

" Search for word under cursor using F4
map <F4> :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **/*.js **/*.xul **/*.xml **/*.xsd **/*.css app/**/*.rb app/**/*.rhtml app/**/*.erb lib/**/*.rb" <Bar> cw<CR>
" Search for word selected by visual using F5
vnoremap <F5> y:execute "noautocmd vimgrep /" . escape(@", '\\/') . "/j **/*.js **/*.xul **/*.xml **/*.xsd **/*.css app/**/*.rb app/**/*.rhtml app/**/*.erb lib/**/*.rb" <Bar> cw<CR>

au FileType xml,xsd exe ":silent %!xmllint --format --recover - 2>/dev/null"
