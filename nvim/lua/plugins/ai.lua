local ok, secrets = pcall(require, "secrets")
local claude_code_oauth_token = ok and secrets.claude_code_oauth_token

return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  opts = {
    opts = { log_level = "DEBUG" },
    adapters = {
      acp = {
        -- claude_code = function()
        --   return require("codecompanion.adapters").extend("claude_code", {
        --     env = {
        --       claude_code_oauth_token = claude_code_oauth_token,
        --     },
        --   })
        -- end,
      },
    },

    interactions = {
      chat = {
        -- adapter = "claude_code",
        adapter = "opencode",

        tools = {
          ["run_command"] = {
            opts = {
              require_approval_before = true,
              require_cmd_approval = true,
              allowed_in_yolo_mode = false,
            },
          },

          opts = {
            auto_submit_errors = false,
            auto_submit_success = false,
          },
        },

        keymaps = {
          send = {
            modes = { n = "<c-s>", i = "<c-s>" },
            opts = {},
          },
          close = {
            modes = { n = "<c-c>", i = "<c-c>" },
            opts = {},
          },
        },
      },
      shared = {
        keymaps = {
          view_diff = {
            modes = { n = "<c-v>" },
            opts = {},
          },
          accept_change = {
            modes = { n = "<c-a>" },
            opts = {},
          },
          reject_change = {
            modes = { n = "<c-r>" },
            opts = {},
          },
          cancel = {
            modes = { n = "<c-d>" },
            opts = {},
          },
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "codecompanion chat" },
  },
}
