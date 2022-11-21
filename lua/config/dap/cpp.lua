local M = {}

function M.setup()
	local dap = require("dap")
	dap.adapters.cppdbg = {
		type = "executable",
		command = { vim.fn.stdpath("data") .. "/mason/bin/codelldb" },
	}
	require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp" } })
end

return M
