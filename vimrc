" ------------------------------------------------------------------------------
" TODO:
"   - CtrlP does not accept tab completion, but :e
"   - history is not updated
"   - reuse wildignore for nerd tree
"   - spead up gvim, it is lag
" ------------------------------------------------------------------------------


" Section: Abbreviation
" ------------------------------------------------------------------------------
" java, c
ab #j /*----------------------------------------------------------------------------*/

" vim
ab #v "-------------------------------------------------------------------------------
ab #c "1}}}---------------------------------------------------------------------------

" bash, python, perl
ab #b #-------------------------------------------------------------------------------
ab #e #1}}}---------------------------------------------------------------------------

" init vundle
se nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'spf13/vim-colors'
Bundle 'vim-scripts/dbext.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/vcscommand.vim'
Bundle 'vim-scripts/Colortest'
Bundle 'majutsushi/tagbar'
Bundle 'gavinbeatty/dragvisuals.vim'
Bundle 'tpope/vim-fugitive'

Bundle 'klen/python-mode'
Bundle 'naquad/ctrlp-digraphs.vim'
"Bundle 'atweiden/vim-betterdigraphs'
Bundle 'chrisbra/unicode.vim'

Bundle 'suy/vim-ctrlp-commandline'

Bundle 'ervandew/eclim'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on
syntax on



" Session: Mappings {{{1
" ------------------------------------------------------------------------------
let mapleader = ","

"ino jk <esc>
"vn jk <esc>
"nn ; :
nn <leader>s :so $MYVIMRC<cr>
"se verbose=0

" map copy/paste
"vm <C-c> "+y
"map <C-v> "+p


" IPA
           "i 
dig ii 618 "ɪ  - small cap I
dig uu 650 "ʊ  - upside down upsilon
           "u:
"---------------------------------------------------
           "e
dig sw 601 "ə  - Latin Small Letter Schwa
dig ro 604 "ɜ: - Latin Small Letter Reversed Open E
dig oc 596 "ɔ: - open-mid back rounded vowel
"---------------------------------------------------
dig ae 230 "æ  - small ae
dig lv 652 "ʌ  - small cap lambda
dig ta 593 "ɑ: - Latin Small Letter Alpha
dig tu 594 "ɒ  - Latin Small Letter Turned Alpha
"---------------------------------------------------
           "p
           "b
           "t
           "d
"---------------------------------------------------
           "f
           "v
dig te 952 "θ - theta
           "
"---------------------------------------------------




dig ez 658 "ʒ - ezh
dig ez 676 "ʤ - Latin Small Letter Dezh Digraph


" switching vim window buffer
"map <c-j> <c-w>j<c-w>_
"map <c-k> <c-w>k<c-w>_
"map <c-h> <c-w>h<c-w>_
"map <c-l> <c-w>l<c-w>_

" this good but i familiar with shift ;
nn ; :
nn : ;

nn v <C-V>
nn <C-V> v

vn v <C-V>
vn <C-V> v

" resize vim
nn <silent> <F11> :exe "vert res -2" <cr>
nn <silent> <F12> :exe "vert res +2" <cr>

" Toggle line numbers
nn <leader>N :setl number!<cr>
" Toggle wrap
nn <Leader>W :setl nowrap! <CR>

" Quick save
nn <silent> <C-c> :update<CR>
"nn <c-s> :update<CR>
"ino <c-s> <esc>:update<CR>
"vn <c-s> <esc>:update<CR>

" Case insensitive search
" use easy motion instead
"nn / /\v
"vn / /\v

" Yank/paste to the OS clipboard with ,y and ,p
vm <leader>y "+y
nn <leader>p "+p

" match bracket pairs with tab is a hell of a lot easier than %
"nn <tab> %
"vn <tab> %

" clear search match
nn <silent> <leader><space> :nohl<cr>

" Quick quit
nn <silent> q :q<cr>
nn <silent> - :bd<cr>

" copy full directory path of opened file to clipboard
nmap cpd :let @+ = expand("%:p:h")<CR>
" copy full file path of opened file to clipboard
nmap cpf :let @+ = expand("%:p")<CR>

" strip \r (^M)
nmap stm :%s/\r//g<CR>

" format paragrath
vm Q gq
nma Q gqap

" clear trailing space
nn <leader>y :%s/\s\+$//<cr>

nn <leader>0 :GenerateTagsJ "%:p:h"<cr>

"1}}}---------------------------------------------------------------------------


" Section: Options:{{{1
"-------------------------------------------------------------------------------

if v:version >= 600
    se autoread
    se foldmethod=marker
    se printoptions=paper:letter
    se sidescrolloff=5
    se mouse=nvi
en

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    en
    scriptencoding utf-8,latin1
    se encoding=utf-8
    setg fileencoding=utf-8
    se fileencodings=ucs-bom,utf-8,latin1
en


se relativenumber
se t_Co=256
se sw=4
se autowrite
se title
se list
"se listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:.
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

se ttyfast
se ttyscroll=3
se lazyredraw
se synmaxcol=174

" No swap files
se nobackup
se nowritebackup
se noswapfile

se hidden
se ignorecase
se smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
se smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop

se showmatch " set show matching parenthesis
se incsearch " show search matches as you type
se hlsearch " highlight search terms

se ai " always set autoindenting on
se copyindent " copy the previous indentation on autoindenting

" windows stuffs
se equalalways
"se eadirection

se backspace=indent,eol,start " allow backspacing over everything in insert mode
se showmode " always show what mode we're currently editing in
se showcmd "
se scrolloff=4 " keep 4 lines off the edges of the screen when scrolling
se virtualedit=all " allow the cursor to go in to "invalid" places
se mouse=a " enable mouse

se pastetoggle=<F2> " when in insert mode, press <F2> to go to paste mode, where you can paste mass data that won't be autoindented
se fileformats="unix,dos,mac"
se wildmenu " make tab completion for files/buffers act like bash
se wildmode=list:longest
se ruler " Show the cursor position all the time
se laststatus=2
se gdefault " :%s/foo/bar/g by default

se history=700 " remember more commands and search history
se undolevels=700 " use many muchos levels of undo

se softtabstop=4 shiftwidth=4 tabstop=4 " not tabs, but spaces
se expandtab
se shiftround " use multiple of shiftwidth when indenting with '<' and '>'

se number " turn on number
"se nonumber " turn on number
se cursorline " highlight current light
" se cursorcolumn

" handle long line correctly
se nowrap
se textwidth=79
se formatoptions=qrn1

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%141v', 100)

se makeprg=make

se foldenable

se sidescroll=1
se sidescrolloff=10

se wildignore+=*.so,*.swp,*.zip,*.class,*.jar,*.gz,*pom.xml.org,*pyc,*.xls,*.svn
se wildignore+=*_build/*,*/coverage/*,*/target/*,*/tmp/*,*/lib/*,*/.settings/*,*/.git/*

" status line
se stl=
"buffer number
se stl+=%-10n
"filename
se stl+=\|\ %f
" status flags
se stl+=%m%r%h
" file type
se stl+=\ \|\ %{strlen(&ft)?&ft:'none'}|
" right align remainder
se stl+=%=
" character hex value
se stl+=0x%-8B
" line, character
se stl+=\|\ %-14(%l,%c%V%)
" file position
se stl+=\|\ %<%P

"se stl=\ %F%m%r%h\ %w\ \ \ %r%{getcwd()}%h\ \ \ %=%-33.(Line\ %l\ of\ %L\ \|\ Column\ %c%V\ \|\ (%P)%)

" completeopt
set cot=menuone,menu,longest
se dict=/usr/share/dict/words
hi Pmenu ctermbg=238 gui=bold

"colo default

"colo peaksea
"colo wombat256mod
se background=dark
colo peaksea
hi CursorLine cterm=NONE ctermbg=237  guibg=#404040 gui=NONE
"hi CursorColumn cterm=NONE ctermbg=237  guibg=#404040 gui=NONE
hi StatusLine cterm=NONE ctermbg=237 ctermfg=226  guibg=#404040 guifg=#ffff00
"hi SignColumn cterm=NONE ctermbg=237  guibg=#404040 gui=NONE
"1}}}---------------------------------------------------------------------------


" Section: Commands {{{1
" ------------------------------------------------------------------------------
fu! Format()
    exe "%s/\s\+$//"
    exe "%s/\t/  /"
endf

fu! FormatURL(url)
    let l:ret = substitute(a:url, '/$', '', '')
    let l:ret = substitute(l:ret, '^/', '', '')
    let l:ret = substitute(l:ret, '/', '-', 'g')
    retu l:ret
endf

fu! GenerateTags(url, ctags_opts)
    echom "Generate tags for project '" . a:url . "'"
    let l:ctags_files = $HOME . "/.tags/" . FormatURL(a:url)
    echom system("ctags " . a:ctags_opts . " -f '" . l:ctags_files . "' \"" . a:url . "\"")
    exe "se tags+=" . l:ctags_files
    exe 'cd ' . a:url
endf

fu! AppendToFile(file, lines)
    call writefile(readfile(a:file)+a:lines, a:file)
endf

com! -n=1 -com=file GenerateTagsC cal GenerateTags(<q-args>,"-R --c++-kinds=+p --fields=+iaS --extra=+q --sort=foldcase --language-force=C++")
com! -n=1 -com=file GenerateTagsJ cal GenerateTags(<q-args>,"-R --java-kinds=+p --fields=+iaS --extra=+q")

fu! GenerateTagsForCLibs()
    let l:global_include = '/usr/include/'
    let l:global_headers = system('find ' . l:global_include . ' -maxdepth 1 -type f | xargs')
    let l:ctags_files = $HOME . "/.tags/" . FormatURL(l:global_include)
    echom system("ctags " . "-R --c++-kinds=+p --fields=+iaS --extra=+q --sort=foldcase --language-force=C++" . " -f '"
                \. l:ctags_files . "' " . l:global_headers . "")
    exe "se tags+=" . l:ctags_files
endf

"just highlight the match in red...
"nnoremap <silent> n   n:call HLNext(0.4)<cr>
"nnoremap <silent> N   N:call HLNext(0.4)<cr>
"highlight WhiteOnRed ctermbg=Red ctermfg=white
"function! HLNext (blinktime)
    "let [bufnum, lnum, col, off] = getpos('.')
    "let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    "let target_pat = '\c\%#'.@/
    "let ring = matchadd('WhiteOnRed', target_pat, 101)
    "redraw
    "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    "call matchdelete(ring)
    "redraw
"endfunction

"1}}}---------------------------------------------------------------------------


" Section: Auto commands {{{1
" ------------------------------------------------------------------------------
aug group_sources
    au!
    au BufWritePost .vimrc so $MYVIMRC
aug END

aug group_file
    au!
    "au BufRead,BufNewFile *.html,*.xhtml,*.xml se softtabstop=2 shiftwidth=2 tabstop=2
    au BufRead,BufNewFile *.html,*.xhtml,*.xml setl foldmethod=indent
    au BufRead,BufNewFile *.c,*.h,*.cpp for each in split(expand('~/.tags/usr-include*'), "\n") | exe "se tags+=" . each | endfo
aug END

"au FileType css setl omnifunc=csscomplete#CompleteCSS
"au FileType html,markdown setl omnifunc=htmlcomplete#CompleteTags
"au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
"au FileType python setl omnifunc=pythoncomplete#Complete
"au FileType ruby setl omnifunc=rubycomplete#Complete
"au FileType java setl omnifunc=javacomplete#Complete
"au FileType xml setl omnifunc=xmlcomplete#CompleteTags

"let g:xml_syntax_folding=1
"au FileType xml,xsd setl foldmethod=syntax

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"1}}}---------------------------------------------------------------------------


" Section: Plugins {{{1
" ------------------------------------------------------------------------------

" Bundle: Tag bar {{{2
" ------------------------------------------------------------------------------
let g:tagbar_autofocus = 1
map <Leader>to :TagbarToggle<cr>
"2}}}---------------------------------------------------------------------------


" Bundle: VCSCommand {{{2
" ------------------------------------------------------------------------------
nn <leader>vd :VCSVimDiff<CR>
"2}}}---------------------------------------------------------------------------


" Bundle: Nerd tree {{{2
" ------------------------------------------------------------------------------
nn <leader>no :NERDTreeToggle<CR>
nn <leader>nf :NERDTreeFind<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let g:NERDTreeDirArrows=0

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
" let NERDTreeQuitOnOpen=2
let NERDTreeWinSize = 40

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1


" Use a single click to fold/unfold directories and a double click to open files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '\.svn$', '^target$', '^\.settings$', '^\.classpath$', '^\.project$', '^\.hg', '.pydevproject'  ]
"2}}}---------------------------------------------------------------------------


" Bundle: CtrlP {{{2
" ------------------------------------------------------------------------------
let g:ctrlp_max_height = 10
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_use_caching = 0

nn <silent> <Leader>p :CtrlP .<CR>
nn <silent> <Leader>o :CtrlPBufTag<CR>
nn <silent> <Leader>i :CtrlPTag<CR>
"nn <silent> <Leader>l :CtrlPLine<CR>
nn <silent> <Leader>z :CtrlPBuffer<CR>
nn <silent> <Leader>m :CtrlPMRUFiles<CR>
"nn <silent> <Leader>j :CtrlPRTS<CR>
nn <silent> <Leader>b :CtrlPBookmarkDir<CR>

let pats = ['\**\([\/?_.0-9A-Za-z]\+\)\([\/]*\)\**\(\\\@<!,\|$\)', '\.', '\\\@<!,']
let subs = ['\1\2\3', '\\.', '.*|.*']
let expr = substitute(&wildignore, pats[0], subs[0], 'g')
let expr = substitute(expr, pats[1], subs[1], 'g')
let expr = substitute(expr, pats[2], subs[2], 'g')
let expr = substitute(expr, '\\,', ',', 'g')
let expr = substitute(expr, '^', '.*', '')
let expr = substitute(expr, '$', '.*', '')
let g:ctrlp_user_command='find %s -type f -regextype posix-extended -not -regex "'.expr .'"'

"CtrlP Command line history
let g:ctrlp_extensions = ['commandline']
com! CtrlPCommandline cal ctrlp#init(ctrlp#commandline#id())
nn <silent> <Leader>q :CtrlPCommandline<CR>
com! CtrlPUnicode call ctrlp#init(ctrlp#unicode#id())
"2}}}---------------------------------------------------------------------------


" Bundle: CtrlP {{{2
" ------------------------------------------------------------------------------
"2}}}---------------------------------------------------------------------------


" Bundle: CppOmniComplete {{{2
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"2}}}---------------------------------------------------------------------------


" Bundle: EasyMotion {{{2
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
"2}}}


" Bundle: dbext {{{2
let g:dbext_default_profile_192_168_95_227_replaceme='type=MYSQL:user=root:passwd=mysql:dbname=replaceme:host=192.168.95.227'
let g:dbext_default_profile_192_168_95_228_replaceme='type=MYSQL:user=root:passwd=mysql:dbname=replaceme:host=192.168.95.228'
let g:dbext_default_profile_192_168_95_111_NI='type=MYSQL:user=root:passwd=mysql:dbname=NI:host=192.168.95.111:port=3307'
let g:dbext_default_profile_192_168_99_246_NI='type=MYSQL:user=root:passwd=mysql:dbname=NI:host=192.168.99.246'
"2}}}---------------------------------------------------------------------------


" Bundle: Eclim {{{2
nn <silent> <Leader>l :LocateFile<CR>
nn <silent> <Leader>s :JavaSearchContext<CR>
nn <silent> <Leader>t :ProjectsTree<CR>
nn <silent> <Leader>h :JavaHierarchy<cr>
xn <silent> <Leader>f :JavaFormat<cr>

nn <silent> <Leader>j :JavaDocComment<cr>

let g:EclimJavaSearchSingleResult='edit'
let g:EclimLocateFileDefaultAction='edit'
let g:EclimLocateFileScope = 'workspace'

com! DoSetBreakPoint cal SetBreakPoint()
nn <silent> sbp :DoSetBreakPoint<CR>

com! DoClearAllBreakPoint cal ClearAllBreakPoint()

nm cpb :let @+ = GetBreakPoint()<CR>
nm cpq :let @+ = GetQualiedName()<cr>

fu! GetBreakPoint()
    return 'stop at ' . GetQualiedName() . ':' . line(".")
endf

fu! ClearAllBreakPoint()
    call writefile([], $HOME . "/.jdbrc")
endf

fu! SetBreakPoint()
    call AppendToFile($HOME . "/.jdbrc", [GetBreakPoint()])
endf

fu! GetQualiedName()
    let l:bp = substitute(split(getline("1"))[1], ';', '.', '')
    let l:bp = l:bp . substitute(expand('%:t'), '.java', '', '')
    return l:bp
endf

" 2}}}

" Bundle: dragvisuals {{{2
vm <expr> H DVB_Drag('left')
vm <expr> L DVB_Drag('right')
vm <expr> J DVB_Drag('down')
vm <expr> K DVB_Drag('up')
vm <expr> D DVB_Duplicate()

" 2}}}

" Bundle: betterdigraphs{{{2
"inoremap <expr>  <C-K>  BDG_GetDigraph()
" 2}}}
"1}}}---------------------------------------------------------------------------

if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif
