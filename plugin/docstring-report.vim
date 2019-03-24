" docstring-report.vim - find docstrings in code
" Maintainer: JohnVonNeumann
" Version: 0.1
" License: This file is placed in the public domain.

" let s:blah scopes the var to our locally `:source`'d `script`
" view `:help internal-variables for more info
let s:file_name = expand('%:t')

" Retrieve a list of lines in the file
let s:def_occurance_line_numbers = []
let s:count = 0
for line in readfile(s:file_name)
        let s:count += 1
        " problems exist with this comparison as it is dumb matching, it will
        " match any and all occurances of `def` regardless of where, what
        " precedes or follows them. a legitimate regex would be more
        " effective/foolproof here, we can edit the search to search for `def
        " `, that is, `def` with a space concatenated, and this will find what
        " we're after but it does feel semi cheap. it does work however.
        if line =~ "def "
                call add(s:def_occurance_line_numbers, s:count)
        endif
endfor

" Using the line numbers of all `def` declarations, iterate through, finding
" the following line and evaluate for the existence of a docstring using one
" of multiple heuristics such as the presence of `"""` or other docstring
" initialisers
" can use the `getline` inbuilt to retrieve a specific line, in this case
" retrieve line number, increment by one, perfom check with getline and `=~`
" string comparison
for occurance in s:def_occurance_line_numbers
        let s:proceeding_line = occurance + 1
        if getline(s:following_line) !~ '"""'
                echo "Docstring does not exist for `def` declaration at line" occurance
        endif
endfor

" Output all `def` declarations without docstrings

" map <unique> <Leader>r <Plug>DocstringReport
