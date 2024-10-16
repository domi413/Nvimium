-- ╭──────────────────────────────────────────────────────────╮
-- │ General configs                                          │
-- ╰──────────────────────────────────────────────────────────╯
-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap
local command = vim.api.nvim_create_user_command

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
keymap.set("v", "<leader>i", "~", { desc = "Toggle case" })
keymap.set("s", "<leader>i", "~", { desc = "Toggle case" })
keymap.set("x", "<leader>i", "~", { desc = "Toggle case" })

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

-- Open fuzzy content finder
keymap.set("n", "<leader>fc", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find content in cwd" })

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
-- lsp configs are defined in lua/plugins/lsp/lspconfig.lua

-- ╭──────────────────────────────────────────────────────────╮
-- │ Treesitter                                               │
-- ╰──────────────────────────────────────────────────────────╯
-- Telescope settings are defined in lua/plugins/telescope.lua
-- and lua/plugins/telescope-file-browser.lua

-- ╭──────────────────────────────────────────────────────────╮
-- │ Debugger                                                 │
-- ╰──────────────────────────────────────────────────────────╯
-- Toggle Breakpoint
keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })

-- Start debugging
keymap.set("n", "<leader>dr", "<cmd> lua require('dap').continue()<CR>")

-- ╭──────────────────────────────────────────────────────────╮
-- │ Git                                                      │
-- ╰──────────────────────────────────────────────────────────╯
-- Open LazyGit
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open Lazy Git" })

-- ╭──────────────────────────────────────────────────────────╮
-- │ Run Code                                                 │
-- ╰──────────────────────────────────────────────────────────╯
-- Every code execute shorcut works like this:
-- <leader> + <leader> + ([r]un / [d]ebug / [c]ompile) + [<filetype shorcut>]
--
-- List of filetype shorcuts:
-- Bash   -> b
-- C      -> c
-- C++    -> +
-- dotNET -> d
-- Python -> p

-- Function to execute a command in current file dir
local function current_file_dir(term_command)
	-- Save the current directory
	local original_dir = vim.fn.getcwd()

	-- Change to the directory of the current file
	local file_path = vim.fn.expand("%:p:h")
	vim.cmd("lcd " .. file_path)

	-- Execute the command
	-- To split the terminal vertically set 'split | term' to 'vert term'
	vim.cmd("split | term " .. term_command)
	-- vim.cmd("vert term " .. term_command)

	-- Reset to the original directory
	vim.cmd("lcd " .. original_dir)
end

----------------------------------------------------------- Bash

-- Run
command("RunBash", function()
	current_file_dir("bash " .. vim.fn.expand("%:p"))
end, {})

keymap.set("n", "<leader><leader>rb", ":w<cr><cmd>RunBash<cr>", { desc = "Run Bash" })

----------------------------------------------------------- C

-- Run (compile + execute)
command("RunC", function()
	local file = vim.fn.expand("%:t")
	local output = vim.fn.expand("%:t:r") .. ".out"
	current_file_dir("clang " .. file .. " -o " .. output .. " && ./" .. output)
end, {})

keymap.set("n", "<leader><leader>rc", ":w<cr><cmd>RunC<cr>", { desc = "Run C" })

-- Compile
command("CompileC", function()
	local file = vim.fn.expand("%:t")
	local output = vim.fn.expand("%:t:r") .. ".out"
	current_file_dir("clang " .. file .. " -o " .. output)
end, {})

keymap.set("n", "<leader><leader>cc", ":w<cr><cmd>CompileC<cr>", { desc = "Compile C" })

----------------------------------------------------------- C++

-- Run (compile + execute)
command("RunCpp", function()
	local file = vim.fn.expand("%:t")
	local output = vim.fn.expand("%:t:r") .. ".out"
	current_file_dir("clang++ " .. file .. " -o " .. output .. " && ./" .. output)
end, {})

keymap.set("n", "<leader><leader>r+", ":w<cr><cmd>RunCpp<cr>", { desc = "Run C++" })

-- Compile
command("CompileCpp", function()
	local file = vim.fn.expand("%:t")
	local output = vim.fn.expand("%:t:r") .. ".out"
	current_file_dir("clang++ " .. file .. " -o " .. output)
end, {})

keymap.set("n", "<leader><leader>c+", ":w<cr><cmd>CompileCpp<cr>", { desc = "Compile C++" })

----------------------------------------------------------- Python

-- Run (Interpret and Execute)
command("RunPython", function()
	current_file_dir("python3 " .. vim.fn.expand("%:p"))
end, {})

keymap.set("n", "<leader><leader>rp", ":w<cr><cmd>RunPython<cr>", { desc = "Run Python" })

-- Compile
command("CompilePython", function()
	current_file_dir("python3 -m py_compile " .. vim.fn.expand("%:p"))
end, {})

keymap.set("n", "<leader><leader>cp", ":w<cr><cmd>CompilePython<cr>", { desc = "Compile Python" })

----------------------------------------------------------- dotNET

-- Build
command("BuildDotnet", function()
	current_file_dir("dotnet build")
end, {})

keymap.set("n", "<leader><leader>bd", ":w<cr><cmd>BuildDotnet<cr>", { desc = "Build .NET" })

-- Run
command("RunDotnet", function()
	current_file_dir("dotnet run")
end, {})

keymap.set("n", "<leader><leader>rd", ":w<cr><cmd>RunDotnet<cr>", { desc = "Run .NET" })

-- -- ╭──────────────────────────────────────────────────────────╮
-- -- │ CMake                                                    │
-- -- ╰──────────────────────────────────────────────────────────╯
-- -- Function to run cmake --build build
-- vim.api.nvim_create_user_command("CMakeBuild", function()
-- 	local build_dir = "build"
--
-- 	-- Check if build directory exists
-- 	if vim.fn.isdirectory(build_dir) == 0 or vim.fn.filereadable(build_dir .. "/CMakeCache.txt") == 0 then
-- 		vim.cmd(
-- 			"split | term echo '\27[31mWarning: Build directory or cache not found. Run :CMakeRebuild first.\27[0m'"
-- 		)
-- 	else
-- 		-- If build directory and cache are found, run the build
-- 		vim.cmd("split | term cmake --build " .. build_dir)
-- 	end
-- end, {})
--
-- keymap.set("n", "<leader><leader>bm", ":w<cr><cmd>CMakeBuild<cr>", { desc = "Build CMake" })
--
-- -- Function to delete and recreate build directory (CMakeRebuild)
-- vim.api.nvim_create_user_command("CMakeRebuild", function()
-- 	local build_dir = "build"
--
-- 	-- Check if build directory exists
-- 	if vim.fn.isdirectory(build_dir) == 1 then
-- 		print("Deleting existing build directory...")
-- 		vim.fn.delete(build_dir, "rf")
-- 	end
--
-- 	print("Creating new build directory...")
-- 	vim.fn.mkdir(build_dir)
--
-- 	print("Running CMake configuration and build...")
-- 	vim.cmd("split | term cmake -B " .. build_dir .. " && cmake --build " .. build_dir)
-- end, {})
--
-- keymap.set("n", "<leader><leader>bM", ":w<cr><cmd>CMakeRebuild<cr>", { desc = "Rebuild CMake" })
