require "nvchad.options"

-- Behavior
vim.cmd("set mouse=a")             -- Use mouse everywhere
vim.cmd("set nowrap")              -- Do not wrap line
vim.cmd("set tw=120")              -- Text width
vim.cmd("set linebreak")           -- Break lines at word (requires Wrap lines)
vim.cmd("set whichwrap+=<,>,h,l,[,]") -- Wrap lines
vim.cmd("set pastetoggle=<F2>")

-- UI
vim.cmd("set relativenumber")      -- Show line numbers
vim.cmd("set showmatch")           -- Highlight matching brace
vim.cmd("set novisualbell")        -- Dont' use visual bell
vim.cmd("set noerrorbells")        -- Don't beep
vim.cmd("set ruler")               -- Show row and column ruler information
vim.cmd("set list")                -- Ensure we show tabs
vim.cmd("set listchars=tab:>·,trail:·") -- Show tabs and trailing whitespace
vim.cmd("set cmdheight=1")         -- Command window height
vim.cmd("set scrolloff=5")         -- Keep 5 lines for (top/bottom) scope
vim.cmd("set laststatus=2")        -- Always show the status line

-- Visuals
vim.cmd("set showmatch")           -- Show matching brackets
vim.cmd("set mat=5")               -- How many tenths of a second to blink matching brackets for
vim.cmd("set nohlsearch")          -- Don't highlight all search results
vim.cmd("set incsearch")           -- Searches for strings incrementally
vim.cmd("set smartcase")           -- Enable smart-case search
vim.cmd("set ignorecase")          -- Always case-insensitive

-- Whitespace
vim.cmd("set autoindent")          -- Auto-indent new lines
vim.cmd("set tabstop=4")           -- Real tabs should be 4, but they will show with set list on
--vim.cmd("set softtabstop=4")       -- Number of spaces per Tab
vim.cmd("set shiftwidth=4")        -- Number of auto-indent spaces
vim.cmd("set smartindent")         -- Enable smart-indent
vim.cmd("set smarttab")            -- Enable smart-tabs
--vim.cmd("set expandtab")           -- Use spaces instead of tabs
vim.cmd("set copyindent")          --
vim.cmd("set preserveindent")      --
vim.cmd("set cindent")             -- C-Style indenting
vim.cmd("filetype plugin indent on") -- Load filetype plugin and indent settings
vim.cmd("let g:indent_guides_enable_on_vim_startup = 1")
vim.cmd("let g:indent_guides_guide_size = 1")
vim.cmd("let g:indent_guides_start_level = 2")

-- History and Backup
vim.cmd("set history=1000")        -- How many lines of history to remember
vim.cmd("set swapfile")
vim.cmd("set directory^=~/.vim/swap//") -- Protect changes between writes
vim.cmd("set writebackup")         -- Protect against crask-during-write
vim.cmd("set nobackup")            -- But do not persist backup after successful write
vim.cmd("set backupcopy=auto")     -- Use rename-and-write-new method whenever safe


vim.cmd("set undolevels=1000")     -- Number of undo levels
vim.cmd("set undofile")            -- Maintain edit history between sessions
vim.cmd("set undodir^=~/.vim/undo//") -- Specify directory for undo files

--
vim.cmd("set backspace=indent,eol,start")  -- Backspace behaviour

vim.cmd("filetype plugin on")

-- File-Based Settings
--autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
vim.cmd("autocmd FileType c,cpp setlocal ts=8 sw=8 sts=8 noet")
vim.cmd("autocmd FileType go setlocal ts=8 sw=8 sts=8 noet")
vim.cmd("autocmd FileType rs setlocal ts=4 sw=4 sts=4 et")
vim.cmd("autocmd FileType rb setlocal ts=2 sw=2 sts=2 et")
vim.cmd("autocmd FileType yaml setlocal ts=2 sw=2 sts=2 et")
vim.cmd("autocmd FileType markdown setlocal spell")
