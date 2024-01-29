local dap = require("dap")

-- ui
require("custom.configs.dap.ui")

-- debuggers
local lldb = require("custom.configs.dap.adapters.lldb")

dap.adapters.lldb = lldb.adapter

dap.configurations.c = lldb.config
dap.configurations.cpp = lldb.config
dap.configurations.rust = lldb.config
