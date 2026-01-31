local M = {}

M.servers = {
  clangd = require("lsp.servers.clangd"),
  qmlls = require("lsp.servers.qmlls"),
}

function M.on_attach(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

return M
