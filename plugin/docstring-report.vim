" docstring-report.vim - find docstrings in code
" Maintainer: JohnVonNeumann
" Version: 0.1
" License: This file is placed in the public domain.

" let s:blah scopes the var to our locally `:source`'d `script`
" view `:help internal-variables for more info
let s:file_name = expand('%:t')
echo s:file_name

" if filereadable(s:file_name)
"         echo "file exists"
" endif
" Retrieve a list of lines in the file
let s:count = 0
for line in readfile(s:file_name)
        let s:count += 1
        if line =~ "def"
                echo s:count line
        endif
endfor

" Maintain a dict/zip with line and a line number index/count so that line
" numbers can be returned

" Iterate through the list of lines, finding all lines that contain a
" declaration of `def`

" Using the line numbers of all `def` declarations, iterate through, finding
" the following line and evaluate for the existence of a docstring using one
" of multiple heuristics such as the presence of `"""` or other docstring
" initialisers

" Output all `def` declarations without docstrings

" map <unique> <Leader>r <Plug>DocstringReport
