" plug.vim {{{
let s:bundle_location = '~/AppData/Local/nvim/bundle'
silent! if plug#begin(s:bundle_location)
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sleuth'
Plug 'folke/which-key.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'andymass/vim-matchup' " % treesitter match
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'hiphish/rainbow-delimiters.nvim'
Plug 'vladdoster/remember.nvim'
Plug 'numToStr/Comment.nvim'
Plug 't9md/vim-choosewin'
Plug 'szw/vim-maximizer'
Plug 'phaazon/hop.nvim'
Plug 'romainl/vim-cool'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'bronson/vim-visual-star-search'
Plug 'kevinhwang91/nvim-bqf'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-rfc'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'honza/vim-snippets'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
call plug#end()
endif
" }}}

" basic {{{
let mapleader      = ' '
let maplocalleader = ' '
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fileformats=unix,mac,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set termguicolors
colorscheme gruvbox

set number
set relativenumber
set nowrap
set guioptions=
set ruler
set laststatus=2
set showmode
set nocursorline
set cmdheight=2
set scrolloff=5
set t_ti=
set t_te=
set shortmess+=c
set list
set listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¬
set mouse=a
set mousehide
set helplang=cn
set termguicolors
set signcolumn=yes

set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set foldmethod=expr
set backspace=indent,eol,start
set inccommand=split
set jumpoptions=stack
set tags=.tags,./.tags
set clipboard=unnamed
set clipboard+=unnamedplus
set hidden
set nobackup
set nowritebackup

set ignorecase
set smartcase
set incsearch
set hlsearch
set magic
set wildmode=list:longest
set wildignore=*.~,*.?~,*.sw?,*.bak,*.hi,*.pyc,*.out,*.lock,
set wildignore=*.DS_Store,*.tags
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.manifest

set updatetime=100
set timeout
set timeoutlen=300
setlocal noswapfile
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" }}}

" autocmd {{{
augroup common
  autocmd!
  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
  autocmd BufNewFile,BufRead *.bean,*.beancount set filetype=beancount
  autocmd FileType json,vim,yaml,cpp,c,cmake setlocal shiftwidth=2 tabstop=2
  autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
  autocmd BufReadPost *.log normal! G
" }}}

" command {{{{
command! -nargs=0 E     e
command! -nargs=0 Q     q
command! -nargs=0 Qa    qa
command! -nargs=0 T     tabnew
command! -nargs=0 W     w
command! -nargs=0 Wa    wa
command! -nargs=0 Wqa   wqa
command! -nargs=0 WQa   wqa

command! -nargs=0 JSONPretty    %!python3 -m json.tool
command! -nargs=0 VSCode        silent! execute ":!code -g %:p\:" . line('.') . ":" . col('.')
command! -nargs=0 BOnly         silent! execute "%bd\|e#\|bd#"
" }}}} command

" mappings {{{{
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q<CR>
nnoremap Q :qa!<cr>
nnoremap Y y$
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
xnoremap < <gv
xnoremap > >gv
map! <S-Insert> <C-R>+
map <silent> <leader>i :e ~/AppData/Local/nvim/init.vim<CR>
map ? /\<\><Left><Left>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" }}}} mappings

" plugins {{{
if exists("g:neovide")
  set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h12
endif

if !empty(glob(s:bundle_location . '/nvim-web-devicons'))
  lua require'nvim-web-devicons'.setup()
endif

if !empty(glob(s:bundle_location . '/which-key.nvim'))
  lua require("which-key").setup()
endif

if !empty(glob(s:bundle_location . '/vim-maximizer'))
  nnoremap <leader>z :MaximizerToggle!<CR>
endif

if !empty(glob(s:bundle_location . '/lualine.nvim'))
lua <<EOF
  require('lualine').setup {
    options = {
      disabled_filetypes = {
        'coc-explorer',
      }
    }
  }
EOF
endif

if !empty(glob(s:bundle_location . '/vim-startify'))
  let g:startify_change_to_dir = 0
  let g:startify_change_to_vcs_root = 1
  let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ ]

  augroup startifyaucmd
    autocmd!
    autocmd VimEnter * if !argc() | Startify | endif
  augroup end
endif

if !empty(glob(s:bundle_location . '/nvim-colorizer.lua'))
  lua require'colorizer'.setup()
endif

if !empty(glob(s:bundle_location . '/Comment.nvim'))
  lua require('Comment').setup()
endif

if !empty(glob(s:bundle_location . '/indent-blankline.nvim'))
lua <<EOF
  require('ibl').setup{
    exclude = {
      filetypes = {
        "startify",
      },
    },
  }
EOF
endif

if !empty(glob(s:bundle_location . '/vim-choosewin'))
  nmap - <Plug>(choosewin)
endif

if !empty(glob(s:bundle_location . '/hop.nvim'))
lua <<EOF
  require'hop'.setup {}
  local hop = require('hop')
  local directions = require('hop.hint').HintDirection
  vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
  end, {remap=true})
  vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
  end, {remap=true})
  vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
  end, {remap=true})
  vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
  end, {remap=true})
EOF
endif

if !empty(glob(s:bundle_location . '/nvim-bqf'))
  augroup bqfaucmd
    autocmd!
    autocmd FileType list lua require('bqf.magicwin.handler').attach()
  augroup end
endif

if !empty(glob(s:bundle_location . '/DoxygenToolkit.vim'))
  let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
  let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
  let g:DoxygenToolkit_authorName="Haifeng Zhang"
endif

if !empty(glob(s:bundle_location . '/nvim-hlslens'))
  noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
        \<Cmd>lua require('hlslens').start()<CR>
  noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
        \<Cmd>lua require('hlslens').start()<CR>
  noremap * *<Cmd>lua require('hlslens').start()<CR>
  noremap # #<Cmd>lua require('hlslens').start()<CR>
  noremap g* g*<Cmd>lua require('hlslens').start()<CR>
  noremap g# g#<Cmd>lua require('hlslens').start()<CR>
  lua require('hlslens').setup()
endif

if !empty(glob(s:bundle_location . '/remember.nvim'))
  lua require('remember')
endif

if !empty(glob(s:bundle_location . '/nvim-treesitter'))
lua <<EOF
  require 'nvim-treesitter.install'.compilers = { "clang" }
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "phpdoc","astro","fortran","qmldir" },
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Tab>", -- normal mode
        node_incremental = "<Tab>", -- visual mode
        node_decremental = "<S-Tab>", -- visual mode
      },
    },
    indent = { enable = true },
    -- extensions
    matchup = { enable = true },
  }
EOF
endif

if !empty(glob(s:bundle_location . '/coc.nvim'))
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('definitionHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  function! s:go_to_definition()
    if CocActionAsync('jumpDefinition')
      return v:true
    endif

    let ret = execute("silent! normal \<C-]>")
    if ret =~ "Error" || ret =~ "错误"
      call searchdecl(expand('<cword>'))
    endif
  endfunction

  function! s:grep_from_selected(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
      normal! `<v`>y
    elseif a:type ==# 'char'
      normal! `[v`]y
    else
      return
    endif
    let word = substitute(@@, '\n$', '', 'g')
    let word = escape(word, '| ')
    let @@ = saved_unnamed_register
    execute 'CocList grep '.word
  endfunction

  function! s:coc_qf_diagnostic() abort
    if !get(g:, 'coc_service_initialized', 0)
      return
    endif
    let diagnostic_list = CocAction('diagnosticList')
    let items = []
    let loc_ranges = []
    for d in diagnostic_list
      let text = printf('[%s%s] %s', (empty(d.source) ? 'coc.nvim' : d.source), (d.code ? ' ' . d.code : ''), split(d.message, '\n')[0])
      let item = {'filename': d.file, 'lnum': d.lnum, 'end_lnum': d.end_lnum, 'col': d.col, 'end_col': d.end_col, 'text': text, 'type': d.severity[0]}
      call add(loc_ranges, d.location.range)
      call add(items, item)
    endfor
    call setqflist([], ' ', {'title': 'CocDiagnosticList', 'items': items, 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}} })
    botright copen
  endfunction

  function! s:coc_qf_jump2loc(locs) abort
    let loc_ranges = map(deepcopy(a:locs), 'v:val.range')
    call setloclist(0, [], ' ', {'title': 'CocLocationList', 'items': a:locs, 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}} })
    let winid = getloclist(0, {'winid': 0}).winid
    if winid == 0
      rightbelow lwindow
    else
      call win_gotoid(winid)
    endif
  endfunction

  let g:copilot_no_tab_map = v:true
  let g:coc_enable_locationlist = 0

  let g:coc_global_extensions = [
        \'coc-clang-format-style-options',
        \'coc-clangd',
        \'coc-cmake',
        \'coc-diagnostic',
        \'coc-dictionary',
        \'coc-docker',
        \'coc-emoji',
        \'coc-explorer',
        \'coc-git',
        \'coc-gitignore',
        \'coc-go',
        \'coc-highlight',
        \'coc-html',
        \'coc-java',
        \'coc-json',
        \'coc-lines',
        \'coc-lists',
        \'coc-lua',
        \'coc-markdownlint',
        \'coc-marketplace',
        \'coc-mocword',
        \'coc-pairs',
        \'coc-powershell',
        \'coc-pyright',
        \'coc-rls',
        \'coc-sh',
        \'coc-snippets',
        \'coc-sql',
        \'coc-sqlfluff',
        \'coc-swagger',
        \'coc-symbol-line',
        \'coc-tag',
        \'coc-toml',
        \'coc-tsserver',
        \'coc-typos',
        \'coc-vimlsp',
        \'coc-word',
        \'coc-xml',
        \'coc-yaml',
        \'coc-yank',
        \]

  let g:coc_filetype_map = {
        \ 'asciidoc': 'markdown',
        \ }

  set tagfunc=CocTagFunc
  set formatexpr=CocActionAsync('formatSelected')

  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  inoremap <silent><expr> <c-space> coc#refresh()
  inoremap <silent><expr> <backspace> coc#pum#visible() ? "\<bs>\<c-r>=coc#start()\<CR>" : "\<bs>"
  inoremap <silent><expr> <c-e> coc#pum#visible() ? coc#pum#cancel() : "\<End>"

  nmap <silent> [d <Plug>(coc-diagnostic-prev)
  nmap <silent> ]d <Plug>(coc-diagnostic-next)
  nmap <silent> [h <Plug>(coc-git-prevchunk)
  nmap <silent> ]h <Plug>(coc-git-nextchunk)
  nmap <silent> [c <Plug>(coc-git-prevconflict)
  nmap <silent> ]c <Plug>(coc-git-nextconflict)
  nmap <silent> ]s <Plug>(coc-typos-next)
  nmap <silent> [s <Plug>(coc-typos-prev)
  nmap <silent> z= <Plug>(coc-typos-fix)

  omap ig <Plug>(coc-git-chunk-inner)
  xmap ig <Plug>(coc-git-chunk-inner)
  omap ag <Plug>(coc-git-chunk-outer)
  xmap ag <Plug>(coc-git-chunk-outer)

  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  nmap <silent> gs <Plug>(coc-git-chunkinfo)
  nmap <silent> gd :call <SID>go_to_definition()<CR>
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references-used)
  nmap <silent> gl <Plug>(coc-codeaction-line)
  nmap <silent> ga <Plug>(coc-codeaction-cursor)
  nmap <silent> gk <Plug>(coc-fix-current)

  nnoremap <silent> K :call <SID>show_documentation()<CR>

  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

  " Use CTRL-S for selections ranges
  " Requires 'textDocument/selectionRange' support of language server
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  nmap <leader>ff :CocList files<CR>
  nmap <leader>fb :CocList buffers<CR>
  nmap <leader>fr :CocList mru<CR>
  nmap <leader>s :CocList gstatus<CR>
  nmap <leader>c :CocList bcommits<CR>
  nmap <leader>o :CocList outline<CR>
  nmap <leader>y :<C-u>CocList -A --normal yank<CR>
  nmap <leader>g :CocList grep<CR>
  vmap <leader>g :<C-u><C-u>call <SID>grep_from_selected(visualmode())<CR><CR>
  nmap <leader>e :CocCommand explorer<CR>
  nmap <leader>a :CocCommand clangd.switchSourceHeader<CR>
  nmap <leader>r <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR><CR>
  nmap <leader>u :call CocAction('runCommand', 'git.chunkUndo')<CR>
  nmap <leader>d <ESC>:CocDiagnostics<CR>
  nmap <leader>hi <ESC>:CocCommand git.chunkInfo<CR>
  nmap <leader>hb <ESC>:CocCommand git.showBlameDoc<CR>

  augroup cocaucmd
    autocmd!
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " autocmd VimEnter * if !argc() | call CocActionAsync('runCommand', 'explorer') | endif
    autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'coc-explorer') |
          \ q | endif
    autocmd FileType coc-explorer setl statusline=coc-explorer
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd BufWritePre *.java,*.go
          \ | silent! call CocAction('runCommand', 'editor.action.organizeImport')
    autocmd User CocLocationsChange call s:coc_qf_jump2loc(g:coc_jump_locations)
  augroup end

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call CocAction('fold', <f-args>)
  command! -nargs=0 Todos CocList -A --normal grep -w TODO|FIXME|FIX|FIXIT|BUG|HACK|XXX

lua << EOF
function _G.symbol_line()
  local curwin = vim.g.statusline_winid or 0
  local curbuf = vim.api.nvim_win_get_buf(curwin)
  local ok, line = pcall(vim.api.nvim_buf_get_var, curbuf, 'coc_symbol_line')
  return ok and line or ' ⋮'
end

vim.o.winbar = '%!v:lua.symbol_line()'
EOF

endif

if !empty(glob(s:bundle_location . '/fzf.vim'))
  let $FZF_DEFAULT_OPTS .= ' --inline-info'

  " All files
  command! -nargs=? -complete=dir AF
        \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
        \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
        \ })))

  let g:fzf_colors =
        \ { 'fg':         ['fg', 'Normal'],
        \ 'bg':         ['bg', 'Normal'],
        \ 'preview-bg': ['bg', 'NormalFloat'],
        \ 'hl':         ['fg', 'Comment'],
        \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':        ['fg', 'Statement'],
        \ 'info':       ['fg', 'PreProc'],
        \ 'border':     ['fg', 'Ignore'],
        \ 'prompt':     ['fg', 'Conditional'],
        \ 'pointer':    ['fg', 'Exception'],
        \ 'marker':     ['fg', 'Keyword'],
        \ 'spinner':    ['fg', 'Label'],
        \ 'header':     ['fg', 'Comment'] }

  if exists('$TMUX')
    let g:fzf_layout = { 'tmux': '-p95%,70%' }
  else
    let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.7 } }
  endif

  command! -bar MoveBack if &buftype == 'nofile' && (winwidth(0) < &columns / 3 || winheight(0) < &lines / 3) | execute "normal! \<c-w>\<c-p>" | endif

  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  nnoremap <silent> <leader>ff :MoveBack<BAR>Files<CR>
  nnoremap <silent> <leader>fb :MoveBack<BAR>Buffers<CR>
  nnoremap <silent> <leader>fr :History<CR>
  nnoremap <silent> <leader>s  :GFiles?<CR>
  nnoremap <silent> <leader>c  :BCommits<CR>
  nnoremap <silent> <leader>g  :Rg <C-R><C-W><CR>
  xnoremap <silent> <leader>g  y:Rg <C-R>"<CR>
  nnoremap <silent> <leader>t  :Rg<CR>
  nnoremap <silent> <Leader>`  :Marks<CR>
endif
" }}}
