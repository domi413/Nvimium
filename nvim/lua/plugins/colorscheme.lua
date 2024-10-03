return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd("colorscheme catppuccin")
		end,
	},
	{ "rose-pine/neovim" },
	{ "neanias/everforest-nvim" },
}
