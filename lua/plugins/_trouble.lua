return {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    module = { "trouble.providers.telescope" },
    config = function()
      require("trouble").setup {
        use_diagnostic_signs = true,
      }
    end,
}