return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    previewers = {
      builtin = {
        treesitter = {
          context = { max_lines = 3, trim_scope = "inner" },
        },
      },
    },
  },
}
