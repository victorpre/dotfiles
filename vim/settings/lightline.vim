function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! CocMinimalStatus() abort
  return get(g:, 'coc_status', '')
endfunction

let g:lightline = {
            \ 'colorscheme': 'dracula',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
            \   'right': [ [ 'cocstatus', 'currentfunction' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'CocMinimalStatus',
            \   'currentfunction': 'CocCurrentFunction',
            \   'fugitive': 'MyFugitive',
            \   'readonly': 'MyReadonly',
            \   'filename': 'MyFilename',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return " "
    else
        return ""
    endif
endfunction

function! MyFugitive()
    if exists("*fugitive#head")
        let _ = FugitiveHead()
        return strlen(_) ? ' '._ : ''
    endif
    return ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ ('' != expand('%') ? expand('%') : '[NoName]')
endfunction

" Use status bar even with
" single buffer
set laststatus=2

" Hide default modeline
set noshowmode
