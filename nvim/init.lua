-- GENERAL SETTINGS
-- Dependencies
require("plugins")
require("keybindings")

-- --------------------------------------------------------------
-- global options
-- --------------------------------------------------------------
vim.cmd [[colorscheme moonfly]]
vim.o.background    = 'dark'
vim.o.termguicolors = true
vim.o.cursorline    = true  -- highlights the current line
vim.o.showmatch     = true  -- show matching
vim.o.ignorecase    = true  -- make searching case insensitive
vim.o.smartcase     = true  -- unless the query has capital letters
vim.o.hlsearch      = true  -- highlight search
vim.o.incsearch     = true  -- incremental search
vim.o.showmode      = false -- disable --INSERT-- (powered by lightline)

vim.o.clipboard     = 'unnamedplus' -- using system clipboard
vim.o.mouse         = 'a'   -- enable mouse click
vim.o.mouse         = 'v'   -- middle-click paste with
vim.o.ttyfast       = true  -- speed up scrolling

-- More natural splits
vim.o.splitbelow    = true  -- Horizontal split (below of current)
vim.o.splitright    = true  -- Vertical split (right of current)

-- --------------------------------------------------------------
-- local window options
-- --------------------------------------------------------------
vim.wo.cursorline     = false -- disable cursor line highlighting
vim.wo.number         = true -- add line numbers
vim.wo.relativenumber = true -- Make relative line numbers default

-- --------------------------------------------------------------
-- local buffer options
-- --------------------------------------------------------------
vim.bo.swapfile    = false -- disable creating swap files
vim.bo.tabstop     = 4     -- number of columns occupied by a tab
vim.bo.softtabstop = 4     -- see multiple spaces as tabstops so <BS> does the right thing
vim.bo.expandtab   = true  -- converts tabs to white space
vim.bo.shiftwidth  = 4	   -- width for autoindents
vim.bo.autoindent  = true  -- indent a new line the same amount as the line just typed

-- Set status bar settings
vim.g.lightline = {
  colorscheme = 'moonfly',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Automatic toggling between line number modes
vim.api.nvim_exec(
  [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]],
  false
)

-- Automatically removing all trailing whitespace
vim.api.nvim_exec(
  [[
  autocmd BufWritePre * :%s/\s\+$//e
]],
  false
)
