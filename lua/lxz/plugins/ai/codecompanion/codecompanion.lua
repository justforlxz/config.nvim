return {
  "olimorris/codecompanion.nvim",
  keys = {
    {
      "<leader>aa",
      "<CMD>CodeCompanionActions<CR>",
      mode = { "n", "v" },
      desc = "CodeCompanion: actions",
    },
    {
      "<leader>ag",
      "<CMD>CodeCompanionChat Toggle<CR>",
      mode = { "n", "v" },
      desc = "CodeCompanion: toggle",
    },
  },
  opts = {
    opts = {
      language = "Chinese",
      send_code = true,
      completion_provider = "blink",
      requires_approval = false,
    },
    prompt_library = {
      ["Generate a Commit Message"] = {
        strategy = "chat",
        description = "Generate a commit message",
        opts = {
          index = 10,
          is_default = true,
          is_slash_cmd = true,
          short_name = "commit",
          user_prompt = true,
          auto_submit = true,
        },
        prompts = {
          {
            role = "user",
            content = function()
              return string.format(
                [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:

```diff
%s
```

Commit content should be written in the following format, And use markdown syntax to display:

```text
<type>[optional scope]: <english description>

[English body]

[Chinese body]

Log: [short description of the change use chinese language]
```

The body line cannot exceed 80 characters.

Submit information content based on the user's intention below:
]],
                vim.fn.system("git --no-pager diff --no-ext-diff --staged")
              )
            end,
            opts = {
              contains_code = true,
            },
          },
        },
      },
    },
    display = {
      chat = {
        start_in_insert_mode = true,
      },
      action_palette = {
        provider = "snacks",
      },
    },
    strategies = {
      chat = {
        opts = {
          completion_provider = "blink", -- blink|cmp|coc|default
        },
        adapter = {
          name = "copilot",
          model = "gpt-4.1",
          -- model = "claude-3.7-sonnet",
          -- model = "claude-sonnet-4",
          -- model = "gemini-2.5-pro",
        },
        slash_commands = {
          ["buffer"] = {
            opts = { provider = "snacks" },
          },
          ["fetch"] = {
            opts = { provider = "snacks" },
          },
          ["file"] = {
            opts = { provider = "snacks" },
          },
          ["help"] = {
            opts = { provider = "snacks" },
          },
          ["image"] = {
            opts = { provider = "snacks" },
          },
          ["symbols"] = {
            opts = { provider = "snacks" },
          },
        },
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
  },
}
