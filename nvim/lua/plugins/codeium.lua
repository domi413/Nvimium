vim.g.codeium_no_map_tab = 1 -- Set the global variable before returning the configuration

return {
	"Exafunction/codeium.vim",

	config = function()
		-- ctrl+f to accept the completion
		vim.keymap.set("i", "<C-f>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })

		-- ctrl+; and ctrl+, to cycle completions
		vim.keymap.set("i", "<c-.>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<c-,>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })

		-- ctrl+x to reject completion
		vim.keymap.set("i", "<c-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })
	end,
}