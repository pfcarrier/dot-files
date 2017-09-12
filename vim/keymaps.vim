" Quick exit of insert mode
inoremap jj <Esc>

" Define space as the leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Make comma an alias for leader, as some people prefer this.
nmap , <leader>

" Remap ` to ' for more efficient use of 'ma'/'`a'
nnoremap ' `
nnoremap ` '

" CtrlP Helpers
nmap <C-P> <esc>:CtrlP <CR>
nnoremap <silent> <Leader>p :CtrlPBuffer<CR>
"nmap <leader>b :CtrlPBuffer<CR>

" User CTRL-f for searching project
noremap <C-F> <esc>:Ack<space>
inoremap <C-F> <esc>:Ack<space>

" Use Shift-movement to switch between windows.
nmap <silent> <S-h> :wincmd h <CR>
nmap <silent> <S-l> :wincmd l <CR>
nmap <silent> <S-j> :wincmd j <CR>
nmap <silent> <S-k> :wincmd k <CR>
noremap J :join<CR> " this fix map above that overwrite 'J'

" Use leader-arrow to move between pane
nnoremap <silent> <leader><UP> :wincmd k<CR>
nnoremap <silent> <leader><DOWN> :wincmd j<CR>
nnoremap <silent> <leader><LEFT> :wincmd h<CR>
nnoremap <silent> <leader><RIGHT> :wincmd l<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" Use CTRL-movement to move between tabs.
nmap <silent> <C-l> :tabnext <CR>
nmap <silent> <C-h> :tabprevious <CR>
nmap <silent> <C-n> :tabnew <CR>

" Use tab/shift-tab to move between tabs
nmap <silent> <tab> :tabnext <CR>
nmap <silent> <s-tab> :tabprevious <CR>

" Edit Vim configs
nmap <leader>va :tabe ~/work/dot-files/vim/abbreviations.vim<CR>
nmap <leader>vk :tabe ~/work/dot-files/vim/keymaps.vim<CR>
nmap <leader>vp :tabe ~/work/dot-files/vim/plug.vim<CR>
nmap <leader>vv :tabe ~/work/dot-files/vim/vimrc<CR>
nmap <leader>vvv :so $MYVIMRC<CR>

" The following three commands enables pasting code snippets
" using F2 key (disables auto-indenting)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <leader>pp :set invpaste paste?<CR>

" F6 and <leader>s toggles spell checking
map <F6> :setlocal spell! spelllang=en_us<CR>
imap <F6> <C-o>:setlocal spell! spelllang=en_us<CR>
map <leader>s :setlocal spell! spelllang=en_us<CR>

" toggle NERDTreeTabsToggle
:nmap <leader>n :NERDTreeTabsToggle<CR>

" Use <leader-m> to toggle mouse on/off
set mouse=
map <Leader>m :let &mouse = ( &mouse == "a"? "" : "a" )<CR>

" prune trailing space
nnoremap <leader>s :%s/\s\+$//<CR>

" prune all tab
nnoremap <leader>ss :%s/\t/  /g<CR>

" ======================= Todo ========================

command! T tabe ~/work/wathever/todo

" ===================== Quickfix ======================

map <leader>- :cnext<CR>            " next quickfix item
map <leader>= :cprevious<CR>        " previous quickfix item
nnoremap <leader>a :cclose<CR>      " close quickfix window

" ========== Golang/vim-go related shortcut ===========

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  autocmd FileType go nmap <leader>r   :GoRun<CR>
  autocmd FileType go nmap <leader>t   :GoTest<CR>
  autocmd FileType go nmap <leader>m   :GoMetaLinter<CR>
  autocmd FileType go nmap <Leader>ss  :GoSameIdsAutoToggle<CR>
  autocmd FileType go nmap <Leader>i   :GoInfo<CR>
  autocmd FileType go nmap <Leader>ii  :GoAutoTypeInfoToggle<CR>
  autocmd FileType go nmap <Leader>c   :GoCoverageToggle<CR>
  autocmd FileType go nmap <leader>b   :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap gr          :call go#def#StackPop(v:count1)<CR>

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" ================= Reposition tab ====================

noremap <A-Left>  :-tabmove<cr>
noremap <A-Right> :+tabmove<cr>

" ==================== Reminder =======================
"
" :tabnew -- newtab or ctrl+n
" 2gt     -- go to tab 2
" <tab>   -- next tab
" vs file -- vertical split open 'file'
" sp file -- horizontal split open 'file'
" <shift><tab> -- previous tab
" <leader>n       -- toggel NERDTreeTabs
" t       -- NERD -> open file in a new tab
" T       -- NERD -> open file in a new tab, stay in NERD
" go      -- open NERDTree file in same windows, stay in NERD pane
" <C-w>arrow  -- switch pane
" <C-w>_  -- give all the space to active pane
" <C-w>=  -- distribute space equaly between all pane
" <C-w>+  -- increase horizontal size of pane by one line
" <C-w>-  -- decrease horizontal size of pane by one line
" <C-w>>  -- increase horizontal size of pane by one line
" <C-w><  -- decrease horizontal size of pane by one line
" ctrl-hl -- move between tab left and right
" <leader>-hjkl -- move between pane
" <leader>arrow -- move between pane
" qa        -- close all
" ci "      -- replace everything between "
" C         -- replace everything from cursor till end of line
" A         -- append at the end of the line
" I         -- insert begin of the line
" C-n       -- new tab
" c-w T     -- move current windows to a new tab
" tab       -- next tab
" S-tab     -- previous tab
" <space><space> -- remove search highlight
" igv
" add text on multiple line ( variation with 'd' )
" <c-v>arrow " select text on multiple line, hit I, type something, hit escape
" modify indentation on mutiple line ( variation with '<' )
" <c-v>arrow " select tesx on multiple line,hit '>', hit '.' multiple time
" while in insert mode some normal mode command can be used with ALT
" E.g. <a-o> insert line
"      <a-I> go begin of line
"      <a-A> go end of line
"      <a-hjkl> bye bye arrow key
" VIM-GO RELATED
" gd        -- go to definition
" ctrl-t    -- go back from definition
" gr        -- go back from definition (alternative)

" Hide/unhide number
:nmap <leader>nn :set number!<CR>
:nmap <leader>nnn :set relativenumber!<CR>

" Switch background light/dark
map <Leader>bg :let &background =
  \ ( &background == "dark"? "light" : "dark" )<CR>
  \ :highlight SpecialKey ctermbg=NONE guibg=NONE<CR>
  \ :highlight ExtraWhitespace ctermbg=red guibg=red<CR>

" Switch colorscheme solarized/molokai
map <Leader>co :let &colorscheme = 
  \ ( &colorscheme == "solarized"? "molokai" : "solarized" )<CR>

" Toggle between colorsheme molokai/solarized
function! ToggleDimTags()
if (g:colors_name == "solarized")
  colors molokai
  set background=dark
else
  colors solarized
  set background=light
endif
endfunction
map <leader>co :call ToggleDimTags()<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

nmap <leader>T :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
