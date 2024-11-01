-- 1. Create this directory: ~/.config/nvim/ftplugin/java.lua
-- 2. Add the following code:
--     local config = {
--      cmd = { "/usr/bin/jdtls" },
--      root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
--     }
--     require("jdtls").start_or_attach(config)

return {
	"mfussenegger/nvim-jdtls",
}
