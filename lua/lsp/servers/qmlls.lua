---@brief
---
--- https://doc.qt.io/qt-6/qtqml-tooling-qmlls.html
---
--- > QML Language Server is a tool shipped with Qt that helps you write code in your favorite (LSP-supporting) editor.
---
--- Source in the [QtDeclarative repository](https://code.qt.io/cgit/qt/qtdeclarative.git/)

---@type vim.lsp.Config
return {
  cmd = { "qmlls", "--build-dir", vim.fn.getcwd() .. "/build", "-E", "--no-cmake-calls" },
  filetypes = { "qml", "qmljs" },
  on_attach = function(_, bufnr)
    vim.diagnostic.enable(false, { bufnr = bufnr })
  end,
}
