return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "NvimTree" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { "filename", "branch", "diagnostics" },
				lualine_c = { "%=" },
				lualine_x = {},
				-- lualine_y = { "filetype", "progress" },
				lualine_y = {
					function()
						return require("codeium.virtual_text").status_string()
					end,
					"filetype",
					"progress",
				},
				lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "filename" },
				lualine_c = {
					function()
						local width = vim.fn.winwidth(0)
						local filename = vim.fn.expand("%:t")
						local location = vim.fn.line(".")

						return string.rep("-", width - (#filename + #tostring(location) + 11))
					end,
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
