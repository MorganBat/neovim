set number
set guifont=FiraCode\ Nerd\ Font:h12

autocmd VimEnter * if expand('%:p:h') ==# '/' | cd ~/projects | endif |" Open the projects directory by default in Neovide

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Remap the arrow keys to move between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Git maps
nnoremap <leader>gg <cmd>Git<cr>
"nnoremap <leader>gg :LazyGit<cr>
nnoremap <leader>lg :LazyGit<cr>

" Buffer maps
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>D :bd<cr>
nnoremap <leader>d :Bdelete<cr>

" Neotree
nnoremap <leader>T :Neotree toggle<cr>

" nmap <leader>rcA :RuboCop<cr>

" Save file hotkey maps
nnoremap <C-s> :w<cr>
nnoremap <D-s> :w<cr>

inoremap <C-s> <C-o>:w<cr>
inoremap <D-s> <C-o>:w<cr>
inoremap <C-z> <C-o>u<cr>
inoremap <D-z> <C-o>u<cr>
inoremap <C-y> <C-o><C-R><cr>
inoremap <D-y> <C-o><C-R><cr>

inoremap <D-b> <C-o>:Neotree close<cr>
nnoremap <D-b> :Neotree close<cr>

nmap <leader>q :q<cr>

" Close all buffers same as VS Code
nnoremap <D-k><D-w> :bufdo bd<cr>

set nocompatible

call plug#begin("~/.config/nvim/plugged")
Plug 'tpope/vim-sensible'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'kdheepak/lazygit.nvim'
Plug 'junegunn/goyo.vim'
Plug 'f-person/git-blame.nvim'
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'claytonrcarter/tree-sitter-phpdoc'
Plug 'tree-sitter/tree-sitter-php'
"Plug 'wellle/context.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ngmy/vim-rubocop'
" Plug 'folke/tokyonight.nvim'
Plug 'vim-airline/vim-airline'
Plug 'eslint/eslint'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'neovim/nvim-lspconfig'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'LunarWatcher/auto-pairs'
Plug 'gbprod/phpactor.nvim'
Plug 'vim-vdebug/vdebug'
Plug 'modess/vim-phpcolors'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'chentoast/marks.nvim'
Plug 'kchmck/vim-coffee-script'
Plug 'StanAngeloff/php.vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'moll/vim-bbye'
Plug 'akinsho/toggleterm.nvim'
Plug 'tpope/vim-commentary'
call plug#end()

colorscheme github_dark_high_contrast

highlight LineNr ctermfg=Red guifg=Red

set termguicolors

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.jsx,*.tsx,*.xml, *.vue'
let g:closetag_always_insert_mode = 1

let g:lsp_settings_filetype_vue = [
      \ 'volar-server',
      \ 'typescript-language-server'
      \ ]

" Function to adjust guifont size
function! AdjustGuifontSize(delta)
  let current_font = &guifont
  let font_parts = split(current_font, ':h')
  let font_name = font_parts[0]
  let current_size = str2nr(font_parts[1])
  let new_size = current_size + a:delta
  let &guifont = font_name . ':h' . new_size
endfunction

" Map keys to increase or decrease font size
nnoremap <C-=> :call AdjustGuifontSize(1)<CR>
nnoremap <C--> :call AdjustGuifontSize(-1)<CR>

" Enable the language server for Go
lua << EOF
	require'nvim-treesitter.configs'.setup {
		ensure_installed = {
			"c",
			"lua",
			"php",
			"phpdoc",
			"javascript",
			"typescript",
			"css",
			"html",
			"json",
			"yaml",
			"go",
			"ruby",
			"python",
			"bash",
			"dockerfile",
			"vim",
			"vimdoc",
			"query",
			"sql",
		},
	
		auto_install = true,
	
		highlight = {
			enable = true -- Enable Treesitter's syntax highlighting
		},

		javascript = {
			tsserver = { filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "coffee", "coffeescript" } }
		},
	}

      require("neo-tree").setup({
        event_handlers = {
          {
            event = "file_open_requested",
            handler = function()
              -- auto close
              -- vimc.cmd("Neotree close")
              -- OR
              require("neo-tree.command").execute({ action = "close" })
            end
          },
        }
      })
  require("toggleterm").setup{
      open_mapping=[[<leader>t]],
      insert_mapping=true,
      direction='float'
  }
  vim.opt.signcolumn = "yes"
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "ruby",
    callback = function()
      vim.lsp.start {
        name = "rubocop",
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
      }
    end,
  })
EOF
