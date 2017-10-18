"
 let g:ctrlp_map = '<C-p>'
 nnoremap <silent> <C-p> :CtrlP<CR>
 nnoremap <silent> ,t :CtrlP<CR>

 " Additional mapping for buffer search
 nnoremap <silent> ,b :CtrlPBuffer<cr>

 " Cmd-Shift-P to clear the cache
 nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

 " Additional mapping for function search
 nnoremap <silent> \f :CtrlPFunky<cr>

 map ,js :CtrlP src/main/scala<CR>
 map ,jr :CtrlP src/main/resources<CR>
 map ,jj :CtrlP src/main/java<CR>
 map ,ja :CtrlP assets<CR>

 map ,ra :CtrlP app/assets<CR>
 map ,rm :CtrlP app/models<CR>
 map ,rc :CtrlP app/controllers<CR>
 map ,rv :CtrlP app/views<CR>
 map ,rr :CtrlP app/assets/javascripts<CR>
 map ,rt :CtrlP test<CR>
