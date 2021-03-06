" VIMRC
" READ ME {{{
" current word - let a=expand('<cword>')
" count word - vimgrep word %"
"
" vim motion
" c-y - move view point down
" c-e - move view point up
"
" vim diff
" do - Get changes from other window into the current window.
" dp - Put the changes from current window into the other window.
" ]c - Jump to the next change.
" [c - Jump to the previous change.
"
" dump vim setting
" :mkvimrc /tmp/map
"
" 1. remove current file
" 2. java import have problem
" 3. choose item in auto complete box
" }}}
" vundle {{{
se nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/badwolf'
Bundle 'vim-scripts/dbext.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/vcscommand.vim'
Bundle 'vim-scripts/Colortest'
Bundle 'majutsushi/tagbar'
Bundle 'gavinbeatty/dragvisuals.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'klen/python-mode'
Bundle 'naquad/ctrlp-digraphs.vim'
Bundle 'atweiden/vim-betterdigraphs'
Bundle 'chrisbra/unicode.vim'
Bundle 'suy/vim-ctrlp-commandline'
Bundle 'vim-scripts/vim-auto-save'
Bundle 'altercation/vim-colors-solarized'
Bundle 'hukl/Smyck-Color-Scheme'
Bundle 'tpope/vim-dispatch'
"Bundle 'airblade/vim-rooter'

"Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'ervandew/eclim'
"Bundle 'tpope/vim-fugitive'

filetype plugin indent on
syntax on

" }}}
" Mappings {{{
let mapleader = ","

" jk as escape
ino jk <esc>
vn jk <esc>

"nn ; :
nn <leader>s :so $MYVIMRC<cr>
"se verbose=0

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
map <c-j> <c-w>j<c-w>_
map <c-k> <c-w>k<c-w>_
map <c-h> <c-w>h<c-w>_
map <c-l> <c-w>l<c-w>_

" this good but i familiar with shift ;
nn ; :
nn : ;

nn v <C-V>
nn <C-V> v

vn v <C-V>
vn <C-V> v

" map copy/paste
vm <C-c> "+y
nn <C-v> "+p

" resize vim
nn <silent> <F11> :exe "vert res -2" <cr>
nn <silent> <F12> :exe "vert res +2" <cr>
nn <silent> <F9>  :exe "res -2" <cr>
nn <silent> <F10> :exe "res +2" <cr>

" Toggle line numbers
nn <leader>N :setl number!<cr>
" Toggle wrap
nn <Leader>W :setl nowrap! <CR>

" Quick save
nn <silent> <C-s> :update<CR>
"nn <c-s> :update<CR>
"ino <c-s> <esc>:update<CR>
"vn <c-s> <esc>:update<CR>

" Case insensitive search
" use easy motion instead
"nn / /\v
"vn / /\v

" Yank/paste to the OS clipboard with ,y and ,p
"vm <leader>y "+y
"nn <leader>p "+p

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
" dos2unix
nm d2u :%s/\r//g<CR>

" strip \r (^M)
nmap stm :%s/\r//g<CR>

" format paragrath
vm Q gq
nma Q gqap

" clear trailing space
nn <leader>y :%s/\s\+$//<cr>

nn <leader>0 :GenerateTagsJ "%:p:h"<cr>

" }}}
" Options {{{
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
se foldlevelstart=10   " open most folds by default
" space open/closes folds
nnoremap <space> za

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
se foldmethod=indent

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

" color
let g:solarized_termcolors=256
set background=dark
colo solarized
"colo smyck

" cursorline, cursorcolumn
hi CursorLine cterm=underline ctermbg=NONE guibg=#404040 gui=NONE

set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=237  guibg=#404040 gui=NONE

hi StatusLine cterm=NONE ctermbg=NONE ctermfg=226  guibg=#404040 guifg=#ffff00

hi SignColumn cterm=NONE ctermbg=237  guibg=#404040 gui=NONE
"
" enable transparent
hi Normal	ctermbg=NONE	cterm=NONE
hi NonText	ctermbg=NONE	cterm=NONE
" }}}
" functions {{{
" toggle between number and relativenumber
" writing
fu! DoEnableWritingMode()
   set wrap
   set linebreak
   set nolist
   set formatoptions=1
   set lbr
endf
com! EnableWritingMode cal DoEnableWritingMode()

" mvn
fu! MvnTest()
   exe "Mvn test -Dtest=" . expand("%:t:r")
endf
com! DoMvnTest cal MvnTest()

fu! MvnTestDebug()
    let l:cmd = "Mvn org.apache.maven.plugins:maven-surefire-plugin:2.9:test "
    let l:cmd = l:cmd . "-Dmaven.surefire.debug=\"-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=1111 -Xnoagent -Djava.compiler=NONE\" test "
    let l:cmd = l:cmd . "-Dtest=" . expand("%:t:r")
    "let @+ = l:cmd
    exe l:cmd
endf
com! DoMvnTestDebug cal MvnTestDebug()

fu! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

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
" }}}
" Auto Groups {{{
"This is a slew of commands that create language-specific settings for certain
"filetypes/file extensions. It is important to note they are wrapped in an
"augroup as this ensures the autocmd's are only applied once. In addition, the
"autocmd! directive clears all the autocmd's for the current group.
aug configgroup
    au!
    "au BufWritePost .vimrc so $MYVIMRC
    au VimEnter * highlight clear SignColumn
    "au BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                "\:call <SID>StripTrailingWhitespaces()
    au FileType java setl foldmethod=indent
    "au FileType java setl list
    "au FileType java setl listchars=tab:+\ ,eol:-
    "au FileType java setl formatprg=par\ -w80\ -T4
    "au FileType php setl expandtab
    "au FileType php setl list
    "au FileType php setl listchars=tab:+\ ,eol:-
    "au FileType php setl formatprg=par\ -w80\ -T4
    "au FileType ruby setl tabstop=2
    "au FileType ruby setl shiftwidth=2
    "au FileType ruby setl softtabstop=2
    "au FileType ruby setl commentstring=#\ %s
    "au FileType python setl commentstring=#\ %s
    "au BufEnter *.cls setl filetype=java
    "au BufEnter *.zsh-theme setl filetype=zsh
    "au BufEnter Makefile setl noexpandtab
    "au BufEnter *.sh setl tabstop=2
    "au BufEnter *.sh setl shiftwidth=2
    "au BufEnter *.sh setl softtabstop=2
    "au BufRead,BufNewFile *.html,*.xhtml,*.xml se softtabstop=2 shiftwidth=2 tabstop=2
    au BufRead,BufNewFile *.html,*.xhtml,*.xml setl foldmethod=indent|setl foldlevel=0
    au BufRead,BufNewFile *.c,*.h,*.cpp for each in split(expand('~/.tags/usr-include*'), "\n") | exe "se tags+=" . each | endfo
    au BufEnter *.txt,vimrc,zshrc,muttrc setl foldmethod=marker|setl foldlevel=0

    "au BufReadPost *.twig colorscheme koehler
    "au BufReadPost *.css colorscheme slate
    "au BufReadPost *.js colorscheme elflord
    "au BufReadPost *.py colorscheme molokai
    "au BufReadPost *.html colorscheme monokai
    "au BufReadPost *.java colorscheme monokai
    "au BufReadPost *.php colorscheme two2tango
augroup END

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

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" Tag bar {{{
let g:tagbar_autofocus = 1
nn <silent> <leader>t :TagbarToggle<cr>
" }}}
" VCSCommand {{{
nn <silent> <leader>vd :VCSVimDiff<CR>
" }}}
" Nerd tree {{{
nn <leader>n :NERDTreeToggle<CR>
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
" }}}
" CtrlP {{{
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_max_height = 30
let g:ctrlp_max_files=100000
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_use_caching = 0
nn <silent> <Leader>o :CtrlPBufTag<CR>
"nn <silent> <Leader>i :CtrlPTag<CR>
nn <silent> <Leader>b :CtrlPBookmarkDir<CR>
nn <silent> <Leader>z :CtrlPBuffer<CR>
nn <silent> <Leader>m :CtrlPMRUFiles<CR>
" conflict with eclim
"nn <silent> <Leader>j :CtrlPRTS<CR>
"nn <silent> <Leader>l :CtrlPLine<CR>
" filter base on wildignore
let pats = ['\**\([\/?_.0-9A-Za-z]\+\)\([\/]*\)\**\(\\\@<!,\|$\)', '\.', '\\\@<!,']
let subs = ['\1\2\3', '\\.', '.*|.*']
let expr = substitute(&wildignore, pats[0], subs[0], 'g')
let expr = substitute(expr, pats[1], subs[1], 'g')
let expr = substitute(expr, pats[2], subs[2], 'g')
let expr = substitute(expr, '\\,', ',', 'g')
let expr = substitute(expr, '^', '.*', '')
let expr = substitute(expr, '$', '.*', '')
"let g:ctrlp_user_command='find %s -type f -regextype posix-extended -not -regex "'.expr .'"'
" }}}
" CtrlP command line {{{
let g:ctrlp_extensions = ['commandline']
com! CtrlPCommandline cal ctrlp#init(ctrlp#commandline#id())
nn <silent> <Leader>q :CtrlPCommandline<CR>
com! CtrlPUnicode call ctrlp#init(ctrlp#unicode#id())
" }}}
" CppOmniComplete {{{
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" }}}
" EasyMotion {{{
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
" }}}
" dbext {{{
let g:dbext_default_profile_192_168_95_227_replaceme='type=MYSQL:user=root:passwd=mysql:dbname=replaceme:host=192.168.95.227'
let g:dbext_default_profile_192_168_95_228_replaceme='type=MYSQL:user=root:passwd=mysql:dbname=replaceme:host=192.168.95.228'
let g:dbext_default_profile_192_168_95_111_NI='type=MYSQL:user=root:passwd=mysql:dbname=NI:host=192.168.95.111:port=3307'
let g:dbext_default_profile_192_168_99_246_NI='type=MYSQL:user=root:passwd=mysql:dbname=NI:host=192.168.99.246'
" }}}
" Eclim {{{
nn <silent> <Leader>l :LocateFile<CR>
nn <silent> <Leader>s :JavaSearchContext<CR>
nn <silent> <Leader>i :JavaImport<CR>
nn <silent> <Leader>p :ProjectsTree<CR>
nn <silent> <Leader>h :JavaHierarchy<cr>
xn <silent> <Leader>f :JavaFormat<cr>
nn <silent> <Leader>j :JavaDocComment<cr>

let g:EclimJavaSearchSingleResult='edit'
let g:EclimLocateFileDefaultAction='edit'
let g:EclimLocateFileScope = 'workspace'
let g:EclimCompletionMethod = 'omnifunc'

fu! CopyBreakPoint()
    let @+ = GetBreakPoint()
endf
com! DoCopyBreakPoint cal CopyBreakPoint()

fu! GetBreakPoint()
    return 'stop at ' . GetQualiedName() . ':' . line(".")
endf

fu! ClearAllBreakPoint()
    call writefile([], $HOME . "/.jdbrc")
endf
com! DoClearAllBreakPoint cal ClearAllBreakPoint()

fu! SetBreakPoint()
    cal AppendToFile($HOME . "/.jdbrc", [GetBreakPoint()])
    cal CopyBreakPoint()
endf
com! DoSetBreakPoint cal SetBreakPoint()

fu! GetQualiedName()
    let l:bp = substitute(split(getline("1"))[1], ';', '.', '')
    let l:bp = l:bp . substitute(expand('%:t'), '.java', '', '')
    return l:bp
endf

fu! ImportAxsProjects()
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/testfwk/cglib"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/testfwk/gsip"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/common"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/configuratorschema/"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/documentationschema/"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/epon/"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/gpon"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/fttbmdu/"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/g6/"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/isam"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/isam_ANSI/"
   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.fwk/isam_ETSI"

   exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.isam.4.5/server"
   "exe "ProjectImport $ROOT/apc.app/plugins/apc.app.plugins.gpon.4.8/server"

   exe "ProjectImport $ROOT/apc.app/apc.app.fwk/components/apc-core/jar"
   exe "ProjectImport $ROOT/apc.app/apc.app.fwk/components/apc-ete-core/jar"
   exe "ProjectImport $ROOT/apc.app/apc.app.fwk/components/dslam-conf/jar"
   exe "ProjectImport $ROOT/apc.app/apc.app.fwk/components/axs-adapter"
   exe "ProjectImport $ROOT/apc.app/apc.app.fwk/components/axs-utils"
   exe "ProjectImport $ROOT/apc.app/apc.app.fwk/components/util"
endf
" }}}
" dragvisuals {{{
vm <expr> H DVB_Drag('left')
vm <expr> L DVB_Drag('right')
vm <expr> J DVB_Drag('down')
vm <expr> K DVB_Drag('up')
vm <expr> D DVB_Duplicate()
" }}}
" betterdigraphs {{{
"inoremap <expr>  <C-K>  BDG_GetDigraph()
" }}}
" Ack {{{
nn <silent> <Leader>a :Ack <cword><cr>
" }}}
" utilsnip{{{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
" }}}
" autosave {{{
let g:auto_save = 1
" }}}
" ack.vim {{{
let g:ackprg = 'ag'
let g:ack_default_options = " -H --nocolor --nogroup --column"
" }}}
" gui {{{
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guifont=Consolas\ 12
endif
" }}}
