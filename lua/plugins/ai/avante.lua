-- NOTE: most templates are inspired from ChatGPT.nvim -> chatgpt-actions.json
local avante_grammar_correction = "将文本更正为标准英语，但保持内部所有代码块完好无损。"
local avante_keywords = "从以下文本中提取主要关键词"
local avante_code_readability_analysis = [[
      你必须识别代码片段中的任何可读性问题。
      需要考虑的一些可读性问题：
      - 命名不明确
      - 目的不明确
      - 多余或明显的注释
      - 缺乏注释
      - 长或复杂的单行代码
      - 嵌套过多
      - 变量名过长
      - 命名和代码风格不一致
      - 代码重复
      你可能会发现其他问题。用户提交了一小段来自较大文件的代码。
      仅列出有可读性问题的行，格式为 <line_num>|<issue and proposed solution>
      如果代码没有问题，仅回复：<OK>
    ]]
local avante_optimize_code = "优化以下代码"
local avante_summarize = "总结以下文本"
local avante_translate = "将此翻译为中文，但保持内部的所有代码块完好无损"
local avante_explain_code = "解释以下代码"
local avante_complete_code = "完成以下用 " .. vim.bo.filetype .. " 编写的代码"
local avante_add_docstring = "为以下代码添加文档字符串"
local avante_fix_bugs = "修复以下代码中的错误（如果有）"
local avante_add_tests = "为以下代码实现测试"
return {
  "yetone/avante.nvim",
  keys = {
    {
      "<leader>aa",
      function()
        require("avante.api").ask()
      end,
      desc = "avante: ask",
      mode = { "n", "v" },
    },
    {
      "<leader>ar",
      function()
        require("avante.api").refresh()
      end,
      desc = "avante: refresh",
      mode = "v",
    },
    {
      "<leader>ae",
      function()
        require("avante.api").edit()
      end,
      desc = "avante: edit",
      mode = { "n", "v" },
    },
    {
      "<leader>ag",
      function()
        require("avante").setup()
        require("avante.api").ask({ question = avante_grammar_correction })
      end,
      mode = { "n", "v" },
      desc = "Grammar Correction(ask)",
    },
    {
      "<leader>ak",
      function()
        require("avante.api").ask({ question = avante_keywords })
      end,
      mode = { "n", "v" },
      desc = "Keywords(ask)",
    },
    {
      "<leader>al",
      function()
        require("avante.api").ask({ question = avante_code_readability_analysis })
      end,
      mode = { "n", "v" },
      desc = "Code Readability Analysis(ask)",
    },
    {
      "<leader>ao",
      function()
        require("avante.api").ask({ question = avante_optimize_code })
      end,
      mode = { "n", "v" },
      desc = "Optimize Code(ask)",
    },
    {
      "<leader>am",
      function()
        require("avante.api").ask({ question = avante_summarize })
      end,
      desc = "Summarize text(ask)",
    },
    {
      "<leader>an",
      function()
        require("avante.api").ask({ question = avante_translate })
      end,
      mode = { "n", "v" },
      desc = "Translate text(ask)",
    },
    {
      "<leader>ax",
      function()
        require("avante.api").ask({ question = avante_explain_code })
      end,
      mode = { "n", "v" },
      desc = "Explain Code(ask)",
    },
    {
      "<leader>ac",
      function()
        require("avante.api").ask({ question = avante_complete_code })
      end,
      mode = { "n", "v" },
      desc = "Complete Code(ask)",
    },
    {
      "<leader>ad",
      function()
        require("avante.api").ask({ question = avante_add_docstring })
      end,
      mode = { "n", "v" },
      desc = "Docstring(ask)",
    },
    {
      "<leader>ab",
      function()
        require("avante.api").ask({ question = avante_fix_bugs })
      end,
      mode = { "n", "v" },
      desc = "Fix Bugs(ask)",
    },
    {
      "<leader>au",
      function()
        require("avante.api").ask({ question = avante_add_tests })
      end,
      mode = { "n", "v" },
      desc = "Add Tests(ask)",
    },
  },
  cmd = "AvanteAsk",
  version = false,
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- for windows
  opts = {
    provider = "copilot",
    copilot = {
      -- model = "claude-3.5-sonnet",
      model = "claude-3.7-sonnet",
      -- model = "DeepSeek-R1",
    },
    vendors = {
      deepseek = {
        __inherited_from = "openai",
        endpoint = "http://localhost:8000/v1",
        api_key_name = "DEEPSEEK_API_KEY",
        model = "deepseek-r1",
        max_tokens = 10240,
      },
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    "MeanderingProgrammer/render-markdown.nvim",
  },
  config = function(_, opts)
    vim.cmd("AvanteBuild")
    require("avante_lib").load()
    require("avante").setup(opts)
  end,
}
