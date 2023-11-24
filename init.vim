set number

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"nnoremap <leader>gg <cmd>Git<cr>
nnoremap <leader>gg :LazyGit<cr>

nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>d :bd<cr>

nnoremap <leader>T :Neotree<cr>

nmap <leader>rcA :RuboCop<cr>

nnoremap <C-s> :w<cr>
nnoremap <D-s> :w<cr>

inoremap <C-s> <C-o>:w<cr>
inoremap <D-s> <C-o>:w<cr>
inoremap <C-z> <c-o>u<cr>
inoremap <D-z> <c-o>u<cr>
inoremap <C-y> <c-o><C-R><cr>
inoremap <D-y> <c-o><C-R><cr>

call plug#begin("~/.config/nvim/plugged")
Plug 'tpope/vim-sensible'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'kdheepak/lazygit.nvim'
Plug 'junegunn/goyo.vim'
Plug 'f-person/git-blame.nvim'
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-endwise'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'wellle/context.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ngmy/vim-rubocop'
Plug 'folke/tokyonight.nvim'
Plug 'vim-airline/vim-airline'
Plug 'eslint/eslint'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'LunarWatcher/auto-pairs'
call plug#end()

colorscheme tokyonight

highlight LineNr ctermfg=Red guifg=Red

" Enable the language server for Go
lua << EOF
  local nvim_lsp = require('lspconfig')
  nvim_lsp.gopls.setup{}
EOF
