set viminfo='10,\"100,:20,%,n~/.viminfo
set tabstop=4
set noexpandtab
set smartindent
set shiftwidth=4
set background=dark
syntax on

au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.elm set filetype=elm

" Fix ~0<pasted buffer>~1 error on copy/paste after using vi
set t_BE=

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Fix ctrl+arrow key navigation under tmux
if &term =~ '^screen'
  " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"

  " Arrow keys http://unix.stackexchange.com/a/34723
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
