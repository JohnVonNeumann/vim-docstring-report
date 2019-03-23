" docstring-report.vim - find docstrings in code
" Maintainer: JohnVonNeumann
" Version: 0.1
" License: This file is placed in the public domain.

let s:file_name = expand('%:t')
echo s:file_name

" Retrieve a list of lines in the file
" for line in readfile((

" Iterate through the list of lines, finding all lines that contain a
" declaration of `def`

" Using the line numbers of all `def` declarations, iterate through, finding
" the following line and evaluate for the existence of a docstring using one
" of multiple heuristics such as the presence of `"""` or other docstring
" initialisers

" Output all `def` declarations without docstrings
