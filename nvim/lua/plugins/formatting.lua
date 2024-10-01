return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				css = { "prettier" },
				cpp = { "clang_format" },
				graphql = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				svelte = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
			},
			formatters = {
				prettier = {
					prepend_args = function()
						return { "--tab-width", "4" }
					end,
				},
				clang_format = {
					command = "clang-format",
					append_args = function()
						return { "--style={BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 80}" }
					end,
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}
