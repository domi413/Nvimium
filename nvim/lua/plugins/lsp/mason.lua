return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"bashls",
				"clangd",
				"emmet_ls",
				"gopls", -- go lsp
				-- "jdtls", -- java lsp -> install from package manager
				"lua_ls",
				"pyright",
				-- "omnisharp",  -- doesn't seem to work, install from package manager instead
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"black", -- python formatter
				"clang-format", -- c/c++ formatter
				"debugpy",
				"eslint_d", -- linter
				"htmlhint", -- html linter
				"isort", -- python import formatter
				"prettier", -- prettier formatter
				"shellcheck",
				"shfmt", -- shell formatter
				"stylua", -- lua formatter
				-- "ruff", -- python linter
			},
		})
	end,
}
