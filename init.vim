call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Theme
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

" Sidebar
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" Footerbar? :D
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim Plugin kleine Zeile links
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Plug 'TaDaa/vimade'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

" Alles rund um die LSP-Config
" Wenn ein LSP für eine Sprache nicht Funktioniert
" immer per NPM mit dem G Flag installieren
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'simrat39/rust-tools.nvim'

"Snipped manager
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Analyisiert das Projekt und macht nices syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Bestes Tool um alles schnell zu kommentieren
Plug 'tpope/vim-commentary'

Plug 'ThePrimeagen/harpoon'

" Zeigt das Indentlevel an, könnte auch Farbe
Plug 'Yggdroot/indentLine'

" Buffer easy zu machen, ohne das VIM sich direkt verpisst
Plug 'moll/vim-bbye'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
call plug#end()

lua require("comp")
" lua require("compe-config")
lua require("python-lsp")
lua require("treesitter")

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Set space to leader key"
nnoremap <space> <Nop>
nnoremap <space> <F1>
let mapleader= " "

" Einfaches switchen zwischen zwei Buffern,
" Funktioniert besser auf Windows als mit der 
" Drecks Touchbar
map <F11> :bp <CR>
map <F12> :bn <CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })<CR>

" NERDTREE
" Hier muss aber noch bisschen was gemacht werden
" so geil läuft das noch nicht
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" autocmd VimEnter * NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap \d :bp<cr>:bd #<cr>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Sexy paste des Clipboards von nicht vim inhalten
nnoremap <leader>wp "*p <CR>

" Aktiviert den Proxy für VIM
nnoremap <leader>gps :! git config --global http.proxy http://10.171.251.29:8080 <CR>
nnoremap <leader>gpu :! git config --global --unset http.proxy http://10.171.251.29:8080 <CR>

" Selbe wie F11 nur für den MAC
nnoremap <F1>:bn <CR>
nnoremap <leader>bp :bp <CR>
nnoremap <leader>q :Bdelete<CR>


" LSP config 
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


set completeopt=menu,menuone,noselect
set cmdheight=2
set tabstop=4 softtabstop=4
set ts=4
set noet
set shiftwidth=4
set noexpandtab
set updatetime=300
set smartindent
set shortmess+=c
set exrc
set relativenumber
set noerrorbells
set nowrap
set scrolloff=8
set nu
set nohlsearch
set smartcase
set splitbelow
set encoding=UTF-8
set list
set ai

"ColorScheme Config for brighter Colors"
if !exists('g:os')
    if has('win32') || has('win16')
        let g:os = 'Windows'
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" Set Fancy Color but only applies to shitty Windows
if g:os == 'Linux'
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
    if (empty($TMUX))
      if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      endif
      "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
      "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
      " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
      if (has("termguicolors"))
        set termguicolors
      endif
    endif
endif

" autocmd vimenter * ++nested colorscheme gruvbox
" https://vimcolorschemes.com/nlknguyen/papercolor-theme
autocmd vimenter * ++nested colorscheme papercolor


autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd Filetype python nnoremap <buffer> <F6> :w<CR>:sp term python "%"<CR>

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" unicode symbols
let g:airline_symbols = {}
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:indentLine_char = '|'
let g:indentLine_enable = 1
" let g:indentLine_color_term = 240
" let g:indentLine_bgcolor_gui = '#3a8c7e'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'

