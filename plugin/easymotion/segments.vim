scriptencoding utf-8
"=============================================================================
" Author: aykamko
" Source: https://github.com/aykamko/vim-easymotion-segments
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" Thanks To: Kim Silkebækken & haya14busa (authors of EasyMotion)
"            Julian (https://github.com/Julian/vim-textobj-variable-segment)
"=============================================================================
" Load Once {{{
if expand("%:p") ==# expand("<sfile>:p")
    unlet! g:loaded_easymotion_segments
endif
if exists('g:loaded_easymotion_segments')
    finish
endif
let g:loaded_easymotion_segments = 1
" }}}
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

" Mapping:
nnoremap <Plug>(easymotion-segments-LF)
    \ :call easymotion#segments#left(0, 0)<CR>
nnoremap <Plug>(easymotion-segments-LB)
    \ :call easymotion#segments#left(0, 1)<CR>
nnoremap <Plug>(easymotion-segments-RF)
    \ :call easymotion#segments#right(0, 0)<CR>
nnoremap <Plug>(easymotion-segments-RB)
    \ :call easymotion#segments#right(0, 1)<CR>

onoremap <Plug>(easymotion-segments-LF)
    \ :call easymotion#segments#left(0, 0)<CR>
onoremap <Plug>(easymotion-segments-LB)
    \ :call easymotion#segments#left(0, 1)<CR>
onoremap <Plug>(easymotion-segments-RF)
    \ :call easymotion#segments#right(0, 0)<CR>
onoremap <Plug>(easymotion-segments-RB)
    \ :call easymotion#segments#right(0, 1)<CR>

xnoremap <Plug>(easymotion-segments-LF)
    \ <Esc>:<C-u>call easymotion#segments#left(1, 0)<CR>
xnoremap <Plug>(easymotion-segments-LB)
    \ <Esc>:<C-u>call easymotion#segments#left(1, 1)<CR>
xnoremap <Plug>(easymotion-segments-RF)
    \ <Esc>:<C-u>call easymotion#segments#right(1, 0)<CR>
xnoremap <Plug>(easymotion-segments-RB)
    \ <Esc>:<C-u>call easymotion#segments#right(1, 1)<CR>

let g:EasyMotionSegments_do_mapping = get(
            \ g:, "EasyMotionSegments_do_mapping", 1)
let g:EasyMotionSegments_key = get(
            \ g:, "EasyMotionSegments_key", "v")
if g:EasyMotionSegments_do_mapping
            \ && !hasmapto('<Plug>(easymotion-segments-LF)')
            \ && !hasmapto('<Plug>(easymotion-segments-LB)')
            \ && !hasmapto('<Plug>(easymotion-segments-RF)')
            \ && !hasmapto('<Plug>(easymotion-segments-RB)')

    let k = g:EasyMotionSegments_key
    let K = toupper(k)
    for mode in ['o', 'n', 'x']
        exec mode.'map <silent> <Plug>(easymotion-prefix)'.k.' <Plug>(easymotion-segments-LF)'
        exec mode.'map <silent> <Plug>(easymotion-prefix)'.K.' <Plug>(easymotion-segments-LB)'
        exec mode.'map <silent> <Plug>(easymotion-prefix)g'.k.' <Plug>(easymotion-segments-RF)'
        exec mode.'map <silent> <Plug>(easymotion-prefix)g'.K.' <Plug>(easymotion-segments-RB)'
    endfor
endif

" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
unlet s:save_cpo
" }}}
" vim: fdm=marker:et:ts=4:sw=4:sts=4
