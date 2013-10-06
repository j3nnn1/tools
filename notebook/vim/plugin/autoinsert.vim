if has("autocmd")
	  augroup autoinsert
	    au!
	    autocmd BufNewFile *.c call s:Template("c")
	    autocmd BufNewFile *.cpp call s:Template("cpp")
	    autocmd BufNewFile *.pl call s:Template("pl")
	    autocmd BufNewFile *.py call s:Template("py")
	  augroup END
	  endif
	  function s:Template(argument)
	          if (a:argument == "help")
	                  echo "Currently available templates:"
	                  echo " c                - Plain C Template"
	                  echo " cpp         - Plain C++ Template"
	          else
	                  " First delete all in the current buffer
	                  %d
	 
	                  " Stuff for plain C
	                  if (a:argument == "c")
	                          0r ~/.vim/skeletons/template.c
	                          set ft=c
	                        elseif (a:argument == "cpp")
	                          0r ~/.vim/skeletons/template.cpp
	                          set ft=cpp
				elseif (a:argument =="pl")
				  0r ~/.vim/skeletons/template.pl
				  set ft=pl
				elseif (a:argument =="py")
				  0r ~/.vim/skeletons/template.py
				  set ft=py
	                  endif
	          endif
	  endfunction
	 
	  command! -nargs=1 Template call s:Template(<f-args>)



