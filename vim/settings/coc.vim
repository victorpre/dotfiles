 " Coc.nvim
let g:coc_global_extensions = ['coc-solargraph', 'coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver','coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml', 'coc-stylelint']
" Better display for messages
set cmdheight=1
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> ,lp <Plug>(coc-diagnostic-prev)
nmap <silent> ,ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> ,ld <Plug>(coc-definition)
nmap <silent> ,lt <Plug>(coc-type-definition)
nmap <silent> ,li <Plug>(coc-implementation)
nmap <silent> ,lf <Plug>(coc-references)

" Remap for rename current word
nmap ,lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


	nnoremap <expr><C-g> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-g>"
	nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocAction('highlight')
" autocmd CursorHold * if ! coc#util#has_float() | silent call CocAction('highlight') | endif
" autocmd CursorHold * if ! coc#util#has_float() | call CocAction('doHover') | endif
