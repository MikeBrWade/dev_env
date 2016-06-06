"------------------------------------------------------------------------------
"                                 Basic Settings
"------------------------------------------------------------------------------
:set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set relativenumber
:set number
:set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
:set autoread
let mapleader=","
set clipboard=unnamed
set wildmode=longest,list,full
set wildmenu
:au FileChangedShell * echo "Warning: File changed on disk"
:com! Q q
com! Qa qa
:com! W w
com! Wa wa
set backspace=indent,eol,start
nmap <F12> :w!<CR>
vmap <F12> <Esc><F12>gv
imap <F12> <Esc><F12>a
command! Filename :put =expand('%:p')
"map ^E $
"imap ^E ^O$
" home
"map ^A g0
"imap ^A ^Og0
set hlsearch


"------------------------------------------------------------------------------
"                               Syntax Highlighting
"------------------------------------------------------------------------------
syntax on
au BufNewFile,BufRead *.mod set filetype=make
au BufNewFile,BufRead *.ut_linux set filetype=make
au BufNewFile,BufRead *.fsw set filetype=make

autocmd BufRead,BufNewFile *.gpj set filetype=gpj

color darkbone 
set background=dark
highlight Search     ctermfg=Black      ctermbg=Red     cterm=NONE

"------------------------------------------------------------------------------
"                               Auto Completion
"------------------------------------------------------------------------------
inoremap <NUL> <C-x><C-]>
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" --------------------
" OmniCppComplete
" --------------------
" set Ctrl+j in insert mode, like VS.Net
imap <C-j> <C-X><C-O>
" :inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<c-g>u\<CR>"
" set completeopt as don't show menu and preview
set completeopt=menuone
set completeopt+=preview
" Popup menu hightLight Group
highlight Pmenu ctermbg=87 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 1
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0
augroup GoAwayPreviewWindow
autocmd! InsertLeave * wincmd z
augroup end
"------------------------------------------------------------------------------
"                               Block Editing
"------------------------------------------------------------------------------
"                               Block Editing
"------------------------------------------------------------------------------
set virtualedit=block
"noremap <C-LeftMouse> <4-LeftMouse>
"inoremap <C-LeftMouse> <4-LeftMouse>
"onoremap <C-LeftMouse> <C-C><4-LeftMouse>
"noremap <C-LeftDrag> <LeftDrag>
"inoremap <C-LeftDrag> <LeftDrag>
"onoremap <C-LeftDrag> <C-C><LeftDrag>
nmap <C-LeftMouse> <LeftMouse><C-V>
vmap <C-LeftDrag> <LeftDrag>
imap <C-LeftMouse> <LeftMouse><C-O><C-V>
vmap <C-LeftMouse> <Esc><LeftMouse><C-V>

"------------------------------------------------------------------------------
"                                  Tab Control
"------------------------------------------------------------------------------
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" Tab bar minimization
let notabs = 0
nnoremap <silent> <F7> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>

"------------------------------------------------------------------------------
"                              Find and Searching
"------------------------------------------------------------------------------
" Easily GREP current word in current file.
command! G  :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc
"Grep inside current file for word
map <F4> :execute 'vimgrep '.expand('<cword>').' '.expand('%') <Bar> :copen <Bar> :cc <CR>
"Grep inside whole current path for word
"map <F4> :execute 'vimgrep '.expand('<cword>').' '.expand('%:p:h')/* <Bar> :copen <Bar> :cc <CR>
"Grep inside current folder for word
map <F5> :execute "grep -IHsrnw  --color=never . -e " . expand("<cword>") . " "  <Bar> :copen <CR>
map <F6> :execute "find . -path '*/.svn' -prune -o -print0" <Bar> "xargs -0 grep -ERsHn --color=always expand("<cword>")" <Bar> :copen <CR>

"------------------------------------------------------------------------------
"                                    Folding
"------------------------------------------------------------------------------
":set foldmethod=manual
:set foldmethod=syntax
:let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf

"------------------------------------------------------------------------------
"                                File Management
"------------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>:wincmd w<CR>
map <F3> :NERDTreeFind<CR>
"au VimEnter *  NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w

"autocmd TabEnter * NERDTreeMirror
"autocmd TabEnter * wincmd w

"------------------------------------------------------------------------------
"                                Window Management
"------------------------------------------------------------------------------
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
:command! -nargs=1 -complete=file Tabv tabe <args>.c | vs <args>.h | NERDTreeToggle
set splitbelow
set splitright
nnoremap <C-S-Up> <C-W><C-J>
nnoremap <C-S-Down> <C-W><C-K>
nnoremap <C-S-Right> <C-W><C-L>
nnoremap <C-S-Left> <C-W><C-H>

"------------------------------------------------------------------------------
"                             Compare Tools
"------------------------------------------------------------------------------
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diffsaved call s:DiffWithSaved()

function! s:DiffWithSVNCheckedOut()
  let filetype=&ft
  diffthis
  vnew | exe "%!svn cat " . expand("#:p")
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diffsvn call s:DiffWithSVNCheckedOut()




":copen Open the quickfix window 
":ccl Close ita





"------------------------------------------------------------------------------
"                              Number Toggle
"------------------------------------------------------------------------------
let g:loaded_numbertoggle = 1
let g:insertmode = 0
let g:focus = 1
let g:relativemode = 1

" Enables relative numbers.
function! EnableRelativeNumbers()
  set number
  set relativenumber
endfunc

" Disables relative numbers.
function! DisableRelativeNumbers()
  set number
  set norelativenumber
endfunc

" NumberToggle toggles between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    call DisableRelativeNumbers()
    let g:relativemode = 0
  else
    call EnableRelativeNumbers()
    let g:relativemode = 1
  endif
endfunc

function! UpdateMode()
  if(&number == 0 && &relativenumber == 0)
    return
  end

  if(g:focus == 0)
    call DisableRelativeNumbers()
  elseif(g:insertmode == 0 && g:relativemode == 1)
    call EnableRelativeNumbers()
  else
    call DisableRelativeNumbers()
  end

  if !exists("&numberwidth") || &numberwidth <= 4
    " Avoid changing actual width of the number column with each jump between
    " number and relativenumber:
    let &numberwidth = max([4, 1+len(line('$'))])
  else
    " Explanation of the calculation:
    " - Add 1 to the calculated maximal width to make room for the space
    " - Assume 4 as the minimum desired width if &numberwidth is not set or is
    "   smaller than 4
    let &numberwidth = max([&numberwidth, 1+len(line('$'))])
  endif
endfunc

function! FocusGained()
  let g:focus = 1
  call UpdateMode()
endfunc

function! FocusLost()
  let g:focus = 0
  call UpdateMode()
endfunc

function! InsertLeave()
  let g:insertmode = 0
  call UpdateMode()
endfunc

function! InsertEnter()
  let g:insertmode = 1
  call UpdateMode()
endfunc

" Automatically set relative line numbers when opening a new document
autocmd BufNewFile * :call UpdateMode()
autocmd BufReadPost * :call UpdateMode()
autocmd FilterReadPost * :call UpdateMode()
autocmd FileReadPost * :call UpdateMode()

" Automatically switch to absolute numbers when focus is lost and switch back
" when the focus is regained.
autocmd FocusLost * :call FocusLost()
autocmd FocusGained * :call FocusGained()
autocmd WinLeave * :call FocusLost()
autocmd WinEnter * :call FocusGained()

" Switch to absolute line numbers when the window loses focus and switch back
" to relative line numbers when the focus is regained.
autocmd WinLeave * :call FocusLost()
" Switch to absolute line numbers when entering insert mode and switch back to
" relative line numbers when switching back to normal mode.
autocmd InsertEnter * :call InsertEnter()
autocmd InsertLeave * :call InsertLeave()

" ensures default behavior / backward compatibility
if ! exists ( 'g:UseNumberToggleTrigger' )
  let g:UseNumberToggleTrigger = 1
endif

if exists('g:NumberToggleTrigger')
  exec "nnoremap <silent> " . g:NumberToggleTrigger . " :call NumberToggle()<cr>"
elseif g:UseNumberToggleTrigger
  nnoremap <silent> <C-m> :call NumberToggle()<cr>
endif
