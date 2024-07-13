require("lazy").setup({
	-- ╭──────────────────────────────────────────────────────────╮
	-- │ colorscheme                                              │
	-- ╰──────────────────────────────────────────────────────────╯
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rebelot/kanagawa.nvim", name = "kanagawa" },
	{ "projekt0n/github-nvim-theme", name = "github" },
	{ "neanias/everforest-nvim", name = "everforest" },
	{ "rose-pine/neovim", name = "rosé", priority = "1000" },

	-- local action_state = require('telescope.actions.state')
	-- local actions = {}
	-- actions.save_colorscheme = function(prompt_bufnr)
	--   local entry = action_state.get_selected_entry(prompt_bufnr)
	--
	--   vim.loop.fs_open('myconfigfile.lua', "w", 432, function(err, fd)
	--     vim.loop.fs_write(fd, "vim.opt.colorscheme = " .. entry.value, nil, function()
	--       vim.loop.fs_close(fd)
	--     end)
	--   end)
	-- end
	--
	-- return actions

	-- ╭──────────────────────────────────────────────────────────╮
	-- │ LSP                                                      │
	-- ╰──────────────────────────────────────────────────────────╯
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
	},
	{
		"williamboman/mason.nvim",
		dependencies = "williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	{ "nvimtools/none-lsp.nvim", dependencies = { "jay-babu/mason-null-ls.nvim" } },

	-- ╭──────────────────────────────────────────────────────────╮
	-- │  Treesitter                                              │
	-- ╰──────────────────────────────────────────────────────────╯
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	},

	-- ╭──────────────────────────────────────────────────────────╮
	-- │   Auto-completion                                        │
	-- ╰──────────────────────────────────────────────────────────╯
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			-- "L3MON4D3/LuaSnip",
			-- "saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim", -- vscode-like pictograms
		},
	},
	-- ╭──────────────────────────────────────────────────────────╮
	-- │ Telescope                                                │
	-- ╰──────────────────────────────────────────────────────────╯
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"DaikyXendo/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- ╭──────────────────────────────────────────────────────────╮
	-- │ Debugger                                                 │
	-- ╰──────────────────────────────────────────────────────────╯
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

	-- ╭──────────────────────────────────────────────────────────╮
	-- │ Other plugins                                            │
	-- ╰──────────────────────────────────────────────────────────╯
	{ "lewis6991/gitsigns.nvim" },
	{ "max397574/better-escape.nvim" },
	{ "akinsho/bufferline.nvim", dependencies = "DaikyXendo/nvim-web-devicons" },
	{ "NvChad/nvim-colorizer.lua" },
	{ "iamcco/markdown-preview.nvim" },
	{ "stevearc/dressing.nvim" },
	{ "stevearc/conform.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "kdheepak/lazygit.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "nvim-lualine/lualine.nvim", dependencies = "DaikyXendo/nvim-web-devicons" },
	{ "karb94/neoscroll.nvim" },
	{ "nvim-tree/nvim-tree.lua", dependencies = "DaikyXendo/nvim-web-devicons" },
	{ "abecodes/tabout.nvim" },
	{ "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "folke/which-key.nvim", event = "VeryLazy" },
	{ "alexghergh/nvim-tmux-navigation" },
})
