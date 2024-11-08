-- ╭──────────────────────────────────────────────────────────╮
-- │ General configs                                          │
-- ╰──────────────────────────────────────────────────────────╯
-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- ╭──────────────────────────────────────────────────────────╮
-- │ Mouse                                                    │
-- ╰──────────────────────────────────────────────────────────╯
vim.cmd([[
  aunmenu PopUp.How-to\ disable\ mouse
  aunmenu PopUp.-1-
]])

-- ╭──────────────────────────────────────────────────────────╮
-- │ Window tiling                                            │
-- ╰──────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sr", "<C-w>=", { desc = "Reset splitted window width / height" })
keymap.set("n", "<leader>x", ":close<CR>", { desc = "Close splitted window" })

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

keymap.set("n", "<C-p>", ":tabn<CR>") -- Go to next tab
keymap.set("n", "<C-n>", ":tabp<CR>") -- To go previous tab

-- <Tab> and <C-i> are equivalent, therefore Tab overwrites ctrl+i,
-- use Ctrl+shift+i instead to get the same result as ctrl+i
-- keymap.set("n", "<Tab>", ":tabn<CR>") -- Go to next tab
-- keymap.set("n", "<S-Tab>", ":tabp<CR>") -- To go previous tab

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
keymap.set("v", "<leader>i", "~", { desc = "Toggle case" })
keymap.set("s", "<leader>i", "~", { desc = "Toggle case" })
keymap.set("x", "<leader>i", "~", { desc = "Toggle case" })

-- Remap 'gx' to open links in the browser
-- This option should work per default with netrw but kinda doesn't work,
-- therefore I remapped it as a workaround
keymap.set("n", "gx", ":!open <cWORD><CR><CR>", { desc = "Open URL under cursor" })

-- Toggle line wrapping
keymap.set("n", "<leader>$", ":set wrap!<CR>", { desc = "Toggle line wrapping" })

-- Save file
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Repeat last macro
keymap.set("n", ",", "@@", { desc = "Repeat last macro" })

-- ╭──────────────────────────────────────────────────────────╮
-- │ Telescope                                                │
-- ╰──────────────────────────────────────────────────────────╯
-- Open file browser
-- keymap.set("n", "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "File Browser" })
keymap.set("n", "<leader>fe", ":Telescope file_browser select_buffer=true<CR>", { desc = "File Browser" })

-- Open fuzzy file finder
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })

-- Open fuzzy content finder
keymap.set("n", "<leader>fc", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find content in cwd" })

-- Change color scheme
keymap.set("n", "<leader>ft", "<cmd>Telescope colorscheme enable_preview=true<cr>", { desc = "Change theme" })

-- Browse TODO comments
keymap.set("n", "<leader>fg", "<cmd>TodoTelescope<cr>", { desc = "Browse TODO comments" })

-- Switch tabs
vim.keymap.set("n", "<leader>st", function()
	require("telescope").extensions["telescope-tabs"].list_tabs()
end, { desc = "Switch tabs" })

-- Other Telescope keybindings are defined in lua/plugins/telescope.lua and
-- lua/plugins/telescope-file-browser.lua

-- ╭──────────────────────────────────────────────────────────╮
-- │ NVIM Tree (File Explorer)                                │
-- ╰──────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })

-- ╭──────────────────────────────────────────────────────────╮
-- │ LSP                                                      │
-- ╰──────────────────────────────────────────────────────────╯
-- lsp configs are defined in lua/plugins/lsp/lspconfig.lua

-- ╭──────────────────────────────────────────────────────────╮
-- │ Treesitter                                               │
-- ╰──────────────────────────────────────────────────────────╯
-- treesitter configs are defined in
-- lua/plugins/treesitter/nvim-treesitter-text-objects.lua

-- ╭──────────────────────────────────────────────────────────╮
-- │ Debugger                                                 │
-- ╰──────────────────────────────────────────────────────────╯
-- debugger configs are defined in lua/plugins/debugger/nvim-dap.lua

-- ╭──────────────────────────────────────────────────────────╮
-- │ Git                                                      │
-- ╰──────────────────────────────────────────────────────────╯
-- Open LazyGit
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open lazy git" })

-- ╭──────────────────────────────────────────────────────────╮
-- │ Codeium                                                  │
-- ╰──────────────────────────────────────────────────────────╯
-- Codeium keybindings are defined in lua/plugins/codeium.lua

-- ╭──────────────────────────────────────────────────────────╮
-- │ Code action                                              │
-- ╰──────────────────────────────────────────────────────────╯
-- Every code execute shorcut works like this:
-- <leader> + <leader> + ([r]un / [b]build / [d]ebug)

-- Function to execute a command in current file dir
local function current_file_dir(term_command)
	-- Save the current directory
	local original_dir = vim.fn.getcwd()

	-- Change to the directory of the current file
	local file_path = vim.fn.expand("%:p:h")
	vim.cmd("lcd " .. file_path)

	-- Execute the command
	-- If you want to split the output vertically, change
	-- 'split | term' to 'vert term'
	vim.cmd("split | term " .. term_command)

	-- Reset to the original directory
	vim.cmd("lcd " .. original_dir)
end

-- Function to execute a command based on the filetype and action
local function action_by_filetype(action)
	local filetype = vim.bo.filetype -- Get filetype
	local file = vim.fn.expand("%:p") -- Get full path
	local file_title = vim.fn.expand("%:t") -- Get file name with extension
	local output = vim.fn.expand("%:t:r") .. ".out" -- Name for compiled output

	-- Save file first
	vim.cmd("w")

	-- Bash
	if filetype == "sh" and action == "run" then
		vim.cmd("silent !chmod +x " .. file)
		current_file_dir("bash " .. file)

	-- C
	elseif filetype == "c" then
		if action == "run" then
			current_file_dir("clang -O2 " .. file_title .. " -o " .. output .. " -lm" .. " && ./" .. output)
		elseif action == "compile" then
			current_file_dir("clang -O2 " .. file_title .. " -o " .. output .. " -lm" .. " && ./" .. output)
		end

	-- C++
	elseif filetype == "cpp" then
		if action == "run" then
			current_file_dir("clang++ -O2 " .. file_title .. " -o " .. output .. " && ./" .. output)
		elseif action == "compile" then
			current_file_dir("clang++ -O2 " .. file_title .. " -o " .. output)
		end

	-- C#
	elseif filetype == "cs" then
		if action == "run" then
			current_file_dir("dotnet run")
		elseif action == "compile" then
			current_file_dir("dotnet build")
		end

	-- Go
	elseif filetype == "go" then
		if action == "run" then
			current_file_dir("go run " .. file)
		elseif action == "compile" then
			current_file_dir("go build -o " .. output .. " " .. file)
		end

	-- Java
	elseif filetype == "java" then
		if action == "run" then
			current_file_dir("javac " .. file_title .. " && java " .. vim.fn.expand("%:t:r"))
		elseif action == "compile" then
			current_file_dir("javac " .. file_title)
		end

	-- JavaScript / TypeScript
	elseif (filetype == "javascript" or filetype == "typescript") and action == "run" then
		current_file_dir("node " .. file)

	-- Lua
	elseif filetype == "lua" and action == "run" then
		current_file_dir("lua " .. file)

	-- Python
	elseif filetype == "python" and action == "run" then
		current_file_dir("python3 " .. file)

	-- ...
	else
		vim.api.nvim_echo({ { "Action not supported for this filetype", "ErrorMsg" } }, false, {})
	end
end

-- Create user commands for running and compiling
local command = vim.api.nvim_create_user_command

command("RunCode", function()
	action_by_filetype("run")
end, {})
command("CompileCode", function()
	action_by_filetype("compile")
end, {})

-- Key mappings to trigger the commands
vim.keymap.set("n", "<leader><leader>r", ":RunCode<CR>", { desc = "Run Code" })
vim.keymap.set("n", "<leader><leader>c", ":CompileCode<CR>", { desc = "Compile Code" })
