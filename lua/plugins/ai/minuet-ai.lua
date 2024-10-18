return {
  "milanglacier/minuet-ai.nvim",
  event = "InsertEnter",
  opts = function()
    return {
      notify = "warn",
      request_timeout = 30,
      provider = "openai_fim_compatible",
      provider_options = {
        openai_compatible = {
          end_point = "http://127.0.0.1:11434/v1/chat/completions",
          model = "llama3.1",
          name = "Ollama",
          stream = true,
          api_key = "OPENAI_API_KEY", -- must be set, can set any value
          optional = {
            stop = "\n\n",
            max_tokens = 128,
          },
        },
        openai_fim_compatible = {
          model = "deepseek-coder",
          end_point = "https://api.deepseek.com/beta/completions",
          name = "Deepseek",
          api_key = "DEEPSEEK_API_KEY",
          stream = true,
          optional = {
            stop = "\n\n",
            max_tokens = 128,
          },
        },
      },
    }
  end,
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function(_, opts)
    require("configs.lsp").add_cmp_source("minuet", 2)
    require("minuet").setup(opts)
  end,
}
