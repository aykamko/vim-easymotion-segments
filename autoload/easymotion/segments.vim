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
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

let s:left_boundaries = ['\([_\-]\+\)\@<=\i', '\<', '\(\l\)\@<=\u', '\(\u\u\)\@<=\l', '\(\a\)\@<=\d', '\(\d\)\@<=\a']
let s:left_boundary = join(s:left_boundaries, '\|')
let s:right_boundaries = ['[^_\-][_\-]', '\l\u', '\(\u\)\@<=\u\l', '\a\d', '\d\a', '\i\>']
let s:right_boundary = join(s:right_boundaries, '\|')

function! easymotion#segments#left(visualmode, direction)
    return EasyMotion#User(s:left_boundary, a:visualmode, a:direction, 0) " a:direction)
endfunction
function! easymotion#segments#right(visualmode, direction)
    return EasyMotion#User(s:right_boundary, a:visualmode, a:direction, 1)
endfunction

" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
unlet s:save_cpo
" }}}
" vim: fdm=marker:et:ts=4:sw=4:sts=4
