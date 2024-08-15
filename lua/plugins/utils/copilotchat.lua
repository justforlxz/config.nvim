return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    keys = {
      {
        "cc",
        function()
          require("CopilotChat").toggle()
        end,
        "n",
        desc = "Copilot Chat",
      },
      {
        "cq",
        function()
          local input = vim.fn.input "Quick Ask: "
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        "n",
        desc = "Copilot Ask",
      },
    },
    cmd = { "CopilotChat", "CopilotChatToggle" },
    config = function(_, opts)
      require("CopilotChat").setup(opts)
    end,
  }