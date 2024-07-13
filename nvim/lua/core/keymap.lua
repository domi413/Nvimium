-- ╭──────────────────────────────────────────────────────────╮
-- │ General configs                                          │
-- ╰──────────────────────────────────────────────────────────╯
-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- ╭──────────────────────────────────────────────────────────╮
-- │ Window tiling                                            │
-- ╰──────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sr", "<C-w>=", { desc = "Reset splitted window width / height" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current splitted window" })

-- Resize splitted windows
keymap.set("n", "<leader>v+", ":vertical resize +10<CR>", { desc = "Increase width of splitted window" })
keymap.set("n", "<leader>v-", ":vertical resize -10<CR>", { desc = "Decrease width of splitted window" })
keymap.set("n", "<leader>h+", ":resize +5<CR>", { desc = "Increase height of splitted window" })
keymap.set("n", "<leader>h-", ":resize -5<CR>", { desc = "Decrease height of splitted window" })

-- ╭──────────────────────────────────────────────────────────╮
-- │ Tab management                                           │
-- ╰──────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>nt", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>ct", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<Tab>", ":tabn<CR>") -- Go to next tab
keymap.set("n", "<S-Tab>", ":tabp<CR>") -- To go previous tab

-- ╭──────────────────────────────────────────────────────────╮
-- │ Editing / Editor                                         │
-- ╰──────────────────────────────────────────────────────────╯
-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- New Line (normal mode)
-- Insert a new line above/below without entering into insert-mode
keymap.set("n", "<leader>o", "o<Esc>", { noremap = true, silent = true, desc = "Insert line above" })
keymap.set("n", "<leader>O", "O<Esc>", { noremap = true, silent = true, desc = "Insert line below" })

-- Toggle case
keymap.set("n", "<leader>i", "~", { desc = "Toggle case" })

-- Remap 'gx' to open links in the browser
-- This option should work per default with netrw but kinda doesn't work,
-- therefore i remapped it as a workaround
keymap.set("n", "gx", ":!open <cWORD><CR><CR>", { desc = "Open URL under cursor" })

-- Toggle line wrapping
keymap.set("n", "<leader>$", ":set wrap!<CR>", { desc = "Toggle line wrapping" })

-- Save file
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- ╭──────────────────────────────────────────────────────────╮
-- │ Telescope                                                │
-- ╰──────────────────────────────────────────────────────────╯
-- Open file browser
-- keymap.set("n", "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "File Browser" })
keymap.set("n", "<leader>fe", ":Telescope file_browser select_buffer=true<CR>", { desc = "File Browser" })

-- Open fuzzy file finder
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })

-- Change color scheme
keymap.set(
	"n",
	"<leader>ft",
	"<cmd>Telescope colorscheme enable_preview=true<cr>",
	{ noremap = true, silent = true, desc = "Change theme" }
)

-- ╭──────────────────────────────────────────────────────────╮
-- │ NVIM Tree (File Explorer)                                │
-- ╰──────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- ╭──────────────────────────────────────────────────────────╮
-- │ LSP                                                      │
-- ╰──────────────────────────────────────────────────────────╯
-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

-- ╭──────────────────────────────────────────────────────────╮
-- │ Treesitter                                               │
-- ╰──────────────────────────────────────────────────────────╯

-- ╭──────────────────────────────────────────────────────────╮
-- │ Git                                                      │
-- ╰──────────────────────────────────────────────────────────╯
-- Open LazyGit
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open lazy git" })
