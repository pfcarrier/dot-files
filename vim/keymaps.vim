" Quick exit of insert mode
"inoremap jj <Esc>

" Define space as the leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Make comma an alias for leader, as some people prefer this.
nmap , <leader>

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

" Ease moving between pane with alt-arrow
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <leader><UP> :wincmd k<CR>
nnoremap <silent> <leader><DOWN> :wincmd j<CR>
nnoremap <silent> <leader><LEFT> :wincmd h<CR>
nnoremap <silent> <leader><RIGHT> :wincmd l<CR>
nnoremap <silent> <leader><k> :wincmd k<CR>
nnoremap <silent> <leader><j> :wincmd j<CR>
nnoremap <silent> <leader><h> :wincmd h<CR>
nnoremap <silent> <leader><l> :wincmd l<CR>

" Use CTRL-movement to move between tabs.
nmap <silent> <C-l> :tabnext <CR>
nmap <silent> <C-h> :tabprevious <CR>
nmap <silent> <C-n> :tabnew <CR>

" Use tab/shift-tab to move between tabs
nmap <silent> <tab> :tabnext <CR>
nmap <silent> <s-tab> :tabprevious <CR>

" Edit Vim configs
nmap <leader>va :vsp<CR>:e ~/work/dot-files/vim/abbreviations.vim<CR>
nmap <leader>vk :vsp<CR>:e ~/work/dot-files/vim/keymaps.vim<CR>
nmap <leader>vp :vsp<CR>:e ~/work/dot-files/vim/plug.vim<CR>
nmap <leader>vv :vsp<CR>:e ~/work/dot-files/vim/vimrc<CR>
nmap <leader>vvv :so $MYVIMRC<CR>

" The following three commands enables pasting code snippets
" using F2 key (disables auto-indenting)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" F6 and <leader>s toggles spell checking
map <F6> :setlocal spell! spelllang=en_us<CR>
imap <F6> <C-o>:setlocal spell! spelllang=en_us<CR>
map <leader>s :setlocal spell! spelllang=en_us<CR>

" toggle NERDTreeTabsToggle
:nmap <leader>n :NERDTreeTabsToggle<CR>

" Use <leader-m> to toggle mouse on/off
set mouse=
map <Leader>m :let &mouse = ( &mouse == "a"? "" : "a" )<CR>

" Go related shortcut
:nmap <leader>f :w<CR>:GoFmt<CR>
:nmap <leader>b :w<CR>:GoBuild<CR>
:nmap <leader>t :w<CR>:GoTest<CR>
:nmap <leader>r :w<CR>:GoRun<CR>
:nmap <leader>l :w<CR>:GoLint<CR>
:nmap gr :call go#def#StackPop(v:count1)<CR>

" Reminder
" :tabnew -- newtab
" 2gt     -- go to tab 2
" <leader>n       -- toggel NERDTreeTabs
" t       -- NERD -> open file in a new tab
" T       -- NERD -> open file in a new tab, stay in NERD
" go      -- open NERDTree file in same windows, stay in NERD pane
" <C-w_>
" <C-w+>
" <C-w->
" <C-w=>
" ctrl-hjkl -- move between pane
" <leader>-hjkl -- move between pane
" <leader>arrow -- move between pane
" qa        -- close all
" ci "      -- replace everything between "
" C         -- replace everything from cursor till end of line
" A         -- append at the end of the line
" I         -- insert begin of the line
" VIM-GO RELATED
" gd        -- go to definition
" ctrl-t    -- go back from definition
" gr        -- go back from definition (alt)

" Hide/unhide number
:nmap <leader>h :set invnumber<CR>:set invrelativenumber<CR>

" Switch background light/dark
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Switch colorscheme solarized/molokai
map <Leader>co :let &colorscheme = ( &colorscheme == "solarized"? "molokai" : "solarized" )<CR>

" Toggle between colorsheme molokai/solarized
function! ToggleDimTags()
if (g:colors_name == "solarized")
  colors molokai
else
  colors solarized
endif
endfunction
map <leader>co :call ToggleDimTags()<CR>
