-- ╭──────────────────────────────────────────────────────────╮
-- │ Options                                                  │
-- ╰──────────────────────────────────────────────────────────╯
-- Here are some general editor configs defined like
-- "relative numbers" and clipbboard-support

local opt = vim.opt -- for conciseness

-- ╭──────────────────────────────────────────────────────────╮
-- │ Relative numbers                                         │
-- ╰──────────────────────────────────────────────────────────╯
-- Show relative line numbers
opt.relativenumber = true

-- Show absoulte line number on cursor line (when relative line number is one)
opt.number = true

-- ╭──────────────────────────────────────────────────────────╮
-- │ Line wrapping                                            │
-- ╰──────────────────────────────────────────────────────────╯
opt.wrap = false

-- ╭──────────────────────────────────────────────────────────╮
-- │ Search preferences                                       │
-- ╰──────────────────────────────────────────────────────────╯
-- Ignores case when searching
-- e.g. -> print(Hello) will be found when searching \hello
opt.ignorecase = true

-- Case sensitive search when writing with mixed cases
-- e.g. -> print(LaTex) , \LATEX (will be false)
opt.smartcase = true

-- ╭──────────────────────────────────────────────────────────╮
-- │ Cursor line                                              │
-- ╰──────────────────────────────────────────────────────────╯
-- Highlights the current cursor line
opt.cursorline = true

-- ╭──────────────────────────────────────────────────────────╮
-- │ Cursor line                                              │
-- ╰──────────────────────────────────────────────────────────╯
-- Turn on termguicolors for nightfly colorscheme to work
-- (Have to use a true color terminal)
opt.termguicolors = true

-- ╭──────────────────────────────────────────────────────────╮
-- │ Indentation                                              │
-- ╰──────────────────────────────────────────────────────────╯
-- Allow backspace on indent, end of line or insert mode start position
opt.backspace = "indent,eol,start"

-- ╭──────────────────────────────────────────────────────────╮
-- │ Clipboard                                                │
-- ╰──────────────────────────────────────────────────────────╯
-- Use system clipboard as default register
-- This options allows to copy text from neovim and paste it
-- in an external application (e.g. chatGPT :) )
opt.clipboard:append("unnamedplus")

-- ╭──────────────────────────────────────────────────────────╮
-- │ Windows tiling                                           │
-- ╰──────────────────────────────────────────────────────────╯
opt.splitright = true
opt.splitbelow = true

-- ╭──────────────────────────────────────────────────────────╮
-- │ Swap file                                                │
-- ╰──────────────────────────────────────────────────────────╯
opt.swapfile = false
