set number

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-W> <C-W><C-W>

nnoremap <leader>gg <cmd>Git<cr>

nnoremap <leader>n :bn<cr>
nnoremap <leader>d :bd<cr>

nnoremap <leader>T :Neotree<cr>

nmap <leader>rcA :RuboCop<cr>

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
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'wellle/context.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ngmy/vim-rubocop'
Plug 'folke/tokyonight.nvim'
Plug 'vim-airline/vim-airline'
Plug 'eslint/eslint'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

colorscheme tokyonight

highlight LineNr ctermfg=Red guifg=Red

