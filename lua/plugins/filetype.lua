return {
  "nathom/filetype.nvim",
  config = function()
    require("filetype").setup({
      overrides = {
        extension = {
          qml = "qmljs",
          qmltypes = "qmljs",
          qmlproject = "qmljs",
          qss = "css",
          qrc = "xml",
          frag = "glsl",
          vert = "glsl",
        },
        function_extensions = {
          ["qmldir"] = function()
            vim.bo.filetype = "qmljs"
          end,
        },
      },
    })
  end,
}
