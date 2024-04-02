return {
	{
		"rmehri01/onenord.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins

		-- Set default colorscheme
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
	},
}
