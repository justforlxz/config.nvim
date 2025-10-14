return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      tools = {
        claude = { cmd = { "ccr", "code" } },
        copilot = { cmd = { "copilot", "--banner" } },
      },
    },
  },
  mux = {
    enabled = true,
  },
}
