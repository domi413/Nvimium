return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			-- Optionally disable cmp source if using virtual text only
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,

				-- A mapping of filetype to true or false, to enable virtual text.
				filetypes = {
					-- markdown = false,
				},
				default_filetype_enabled = true,

				-- How long to wait (in ms) before requesting completions after typing stops.
				idle_delay = 75,

				-- Set to false to disable all key bindings for managing completions.
				map_keys = true,

				-- Key bindings for managing completions in virtual text mode.
				key_bindings = {
					-- Accept the current completion.
					accept = "<C-f>",
					-- Accept the next word.
					accept_word = "<C-d>",
					-- Accept the next line.
					accept_line = false,
					-- Clear the virtual text.
					clear = "<C-x>",
					-- Cycle to the next completion.
					next = "<C-.>",
					-- Cycle to the previous completion.
					prev = "<C-,>",
				},
			},
		})
	end,
}
