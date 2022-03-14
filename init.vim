"------------------------------------------------------------------------------
" basic stuff
"------------------------------------------------------------------------------
"
"filetype detection, plugin detection, indent detection
filetype plugin indent on
"colored syntax highlighting
syntax on

" sets proper tabbing
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

"lets you switch between vim files without needing swap files
set hidden

"gives relative line numbers, and the current line number
set relativenumber
set nu

"enables backspaces
set backspace=indent,eol,start

"disable swap files
set noswapfile

" start scrolling when you are 8 characters from the end
set scrolloff=8

" SOME remaps
" remap the escape key to jk if fast succession. This way, exiting insert mode
" is easier.
:imap jk <Esc>
:vmap jk <Esc>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR> 
vnoremap <C-s> <Esc>:w<CR>
nmap po o<Esc>k
nmap PO O<Esc>j
set timeoutlen=400
nnoremap Y y$

" cool thing to be able to move lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==i
inoremap <C-j> <esc>:m .+1<CR>==i
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" quick fix list navigation
nnoremap qj :cn<CR>
nnoremap qk :cp<CR>

" yank and paste to system clipboard
noremap ty "+y
noremap tY "+Y 
noremap tp "+p
noremap tP "+P

" wrap a word in quotes
:nnoremap <tab>" ciw""<Esc>P
:nnoremap <tab>' ciw''<Esc>P
:nnoremap <tab>{ ciw{}<Esc>P
:nnoremap <tab>[ ciw[]<Esc>P
:nnoremap <tab>( ciw()<Esc>P

:vnoremap <tab>" c""<Esc>P
:vnoremap <tab>' c''<Esc>P
:vnoremap <tab>{ c{}<Esc>P
:vnoremap <tab>[ c[]<Esc>P
:vnoremap <tab>( c()<Esc>P

" From a root directory on a fresh tmux pane, create a template layout with
" nvim open, two terminals to the right taking about 1/3rd of the page, and
" NERTree open
:nmap <leader><leader>1 <cmd>!tmux split-window -h -c ${PWD};tmux resize-pane -R 30;tmux split-window -c ${PWD}; tmux select-pane -L<cr> <cmd>NERDTree<cr> <cmd>wincmd l<cr>

"set path to include current directory and all childeren directories - note,
"be careful of large projects, this path will bottleneck performance
set path=.,**

" No line wrapping
set nowrap

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"------------------------------------------------------------------------------
" plug in install 
"------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged/')
" misc
Plug 'stevearc/vim-arduino' " make for arduino
Plug 'jpalardy/vim-slime', { 'for': 'python' } " run python script in a seperate tmux window
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' } " same
Plug 'haya14busa/incsearch.vim' " include search and search highlighting 
Plug 'caenrique/nvim-maximize-window-toggle' " toggle maximize window
Plug 'preservim/nerdtree' " file nav
Plug 'christoomey/vim-tmux-navigator' " vim tmux navigation

" language server protocol
Plug 'neovim/nvim-lspconfig'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" telescope
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/harpoon'

" Plug 'kana/vim-smartinput'
" visual themes
Plug 'gruvbox-community/gruvbox' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Open NERDTree by default
" autocmd VimEnter * NERDTree
" cd into dir when you enter into it.
let g:NERDTreeChDirMode = 2
nnoremap <leader><leader>N <cmd>:NERDTreeRefreshRoot<CR>

"------------------------------------------------------------------------------
" gruvbox configuration
"------------------------------------------------------------------------------
" colorscheme
colorscheme gruvbox

"------------------------------------------------------------------------------
" toggle window maximize configuration
"------------------------------------------------------------------------------
nnoremap <leader>z :ToggleOnly<Enter>

"------------------------------------------------------------------------------
" autocompletion configuration
"------------------------------------------------------------------------------     
" let g:deoplete#enable_at_startup = 1

"------------------------------------------------------------------------------
" harpoon configuration
"------------------------------------------------------------------------------
lua require("telescope").load_extension('harpoon')
nnoremap <leader>fh <cmd>:Telescope harpoon marks<cr>
nnoremap <leader>m <cmd>:lua require("harpoon.mark").add_file()<cr>
nnoremap fh <cmd>:lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>j <cmd>:lua require("harpoon.ui").nav_next()<cr>
nnoremap <leader>k <cmd>:lua require("harpoon.ui").nav_prev()<cr>
nnoremap <leader>1 <cmd>:lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>2 <cmd>:lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <leader>3 <cmd>:lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <leader>4 <cmd>:lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <leader>5 <cmd>:lua require("harpoon.ui").nav_file(5)<cr>
nnoremap <leader>6 <cmd>:lua require("harpoon.ui").nav_file(6)<cr>
nnoremap <leader>7 <cmd>:lua require("harpoon.ui").nav_file(7)<cr>


"------------------------------------------------------------------------------
" telescope configuration
"------------------------------------------------------------------------------
" Telescope options
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fq <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>f? <cmd>lua require('telescope.builtin').help_tags()<cr>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        vimgrep_arguments = {
            'rg',
        },

        prompt_prefix = '>',
        color_devicons = true,

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-k>"] = actions.preview_scrolling_up,
            },
        }
    },
    extensions = {
        fxy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
EOF

"------------------------------------------------------------------------------
" slime configuration 
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1
"------------------------------------------------------------------------------
" vsnip configuration
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>r to run script
nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>


"------------------------------------------------------------------------------
" lsp configuration
"------------------------------------------------------------------------------
lua << EOF
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.ccls.setup{
    init_options = {
        highlight = { lsRanges = true }
    },
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "ff", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "fd", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    end,
    capabilities = capabilities
} -- connect to ccls server with arguments for key bindings on attachment to server
require'lspconfig'.pyright.setup{
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "ff", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "fd", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    end,
    capabilities = capabilities
}
require'lspconfig'.rust_analyzer.setup({
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "ff", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "fd", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    end,
    capabilities=capabilities
})
EOF

nnoremap <leader><leader>c <cmd>!cmake -H. -BDebug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES; ln -s Debug/compile_commands.json .<cr>
nnoremap <leader><leader>C <cmd>!./devel/setup.zsh; cmake -H./src/ -BDebug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES; ln -s Debug/compile_commands.json .<cr>


"------------------------------------------------------------------------------
" cmp completion configuration
"------------------------------------------------------------------------------
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {        
      
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i", "s" }),

    ["<C-s>"] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<C-a>"] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path' }, -- path completion
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'buffer' }, -- from buffer completion
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
EOF

"------------------------------------------------------------------------------
" include search
"------------------------------------------------------------------------------
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" path to your python 
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'


