return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			blue = "#80a0ff",
			cyan = "#79dac8",
			black = "#080808",
			white = "#c6c6c6",
			red = "#ff5189",
			violet = "#d183e8",
			grey = "#303030",
		}

		-- Custom theme
		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.violet },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white },
			},

			insert = { a = { fg = colors.black, bg = colors.blue } },
			visual = { a = { fg = colors.black, bg = colors.cyan } },
			replace = { a = { fg = colors.black, bg = colors.red } },

			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white },
			},
		}

		-- Function to set to lualine theme according to the background color
		local function update_lualine_theme()
			local normal_bg_color = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
			if not normal_bg_color then
				normal_bg_color = 0xFFFFFF -- Fallback color if not set
			end

			-- Convert the color to hexadecimal and compare
			local hex_color = string.format("%06x", normal_bg_color)
			local brightness_threshold = "7fffff"
			local ayu_theme = (hex_color > brightness_threshold) and "ayu_light" or "ayu_mirage"

			require("lualine").setup({
				options = {
					theme = ayu_theme, -- Uses the dynamic theme based on background brightness
					component_separators = "",
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "NvimTree" },
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
					lualine_b = { "filename", "branch", "diagnostics" },
					lualine_c = { "%=" },
					lualine_x = {},
					lualine_y = { "filetype", "progress" },
					lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end

		-- Initial lualine setup
		update_lualine_theme()

		-- Autocmd to update lualine when colorscheme changes
		vim.api.nvim_create_autocmd("Colorscheme", {
			callback = function()
				update_lualine_theme()
			end,
		})
	end,
}
