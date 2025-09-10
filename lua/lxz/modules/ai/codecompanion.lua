return {
  { "groveer/nvvim", import = "nvvim.plugins.ai.codecompanion-cmp" },
  { "groveer/nvvim", import = "nvvim.plugins.ai.codecompanion" },
  { "groveer/nvvim", import = "nvvim.plugins.ai.copilot-cmp" },
  { "groveer/nvvim", import = "nvvim.plugins.ai.copilot" },
  { "groveer/nvvim", import = "nvvim.plugins.ai.mcphub" },

  --- override
  { import = "lxz.plugins.ai.codecompanion.codecompanion-cmp" },
  { import = "lxz.plugins.ai.codecompanion.codecompanion" },
  { import = "lxz.plugins.ai.codecompanion.copilot-cmp" },
  { import = "lxz.plugins.ai.codecompanion.copilot" },
  { import = "lxz.plugins.ai.codecompanion.mcphub" },
}
