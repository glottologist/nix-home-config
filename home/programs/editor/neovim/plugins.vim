" shows list of yanked text (coc-yank plugin)
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" ripgrep smartcase (search with case insensitive)
let g:rg_command = 'rg --vimgrep -S'

" search work under cursor with CtrlSF (it uses ripgrep as the engine)
nmap <silent> <M-f> <Plug>CtrlSFCwordPath <CR>

" open quickfix windows when running AsyncRun
let g:asyncrun_open = 8

" airline: status bar at the bottom
let g:airline_powerline_fonts=1

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Highlighting for jsonc filetype
autocmd FileType json syntax match Comment +\/\/.\+$+

" EasyMotion search with highlighting
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Hoogle config
let g:hoogle_search_count = 20
au BufNewFile,BufRead *.hs map <silent> <F1> :Hoogle<CR>
au BufNewFile,BufRead *.hs map <silent> <C-c> :HoogleClose<CR>

" Nerdtree
map <C-F> :NERDTreeToggle<CR>
map <C-S> :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1


" Nerd commenter
filetype plugin on

" Nerdtree git plugin symbols
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "ᵐ",
    \ "Staged"    : "ˢ",
    \ "Untracked" : "ᵘ",
    \ "Renamed"   : "ʳ",
    \ "Unmerged"  : "ᶴ",
    \ "Deleted"   : "ˣ",
    \ "Dirty"     : "˜",
    \ "Clean"     : "ᵅ",
    \ "Unknown"   : "?"
    \ }
 

" NerdTree automatically open 
autocmd StdinReadPre * let s:std_in=1
autocmd VImEnter * if argc() == 0 && !exists("s:std_in") | NERDTree endif

" NerdTree automatically close
let g:NERDTreeQuitOnOpen = 1 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 

" NerdTree Deleting Files
let g:NERDTreeAutoDeleteBuffer = 1 



" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Fuzzy finder shortcut
nnoremap <C-p> :FZF<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Theme material-vim
"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_theme_style = 'ocean-community'
let g:lightline = { 'colorscheme': 'material_vim' }

" FZF Hoogle
let g:hoogle_fzf_cache_file = '~/.cache/fzf-hoogle/cache.json'
nnoremap <leader>h :Hoogle <CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsExpandTrigger="<C-J>"

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


"  Markdown Syntax Highlighting
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END


nnoremap <M-m> :MarkdownPreview<CR>