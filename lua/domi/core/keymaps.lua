-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
keymap.set("n", "D", '"_D')
keymap.set("n", "dd", '"_dd')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- Resize window shortcuts
keymap.set("n", "<leader>v+", ":vertical resize +10<CR>", opts) -- increase width of split window
keymap.set("n", "<leader>v-", ":vertical resize -10<CR>", opts) -- decrease width of split window
keymap.set("n", "<leader>h+", ":resize +5<CR>", opts) -- increase height of split window
keymap.set("n", "<leader>h-", ":resize -5<CR>", opts) -- decrease height of split window

-- Tab management
keymap.set("n", "<leader>nt", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>ct", ":tabclose<CR>") -- close current tab
keymap.set("n", "<Tab>", ":tabn<CR>")
keymap.set("n", "<S-Tab>", ":tabp<CR>")

-- Indent management
keymap.set("i", "<S-Tab>", "<C-d>", opts) -- for insert mode

-- New Line (normal mode)
keymap.set("n", "<leader>o", "o<Esc>", { noremap = true, silent = true })
keymap.set("n", "<leader>O", "O<Esc>", { noremap = true, silent = true }) -- new line below
