local ok, secrets = pcall(require, "secrets")
local claude_code_oauth_token = ok and secrets.claude_code_oauth_token

-- return {
--   "olimorris/codecompanion.nvim",
--   version = "^19.0.0",
--   opts = {
--   },
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-treesitter/nvim-treesitter",
--   },
-- }

-- return {
--   "olimorris/codecompanion.nvim",
--   version = "^19.0.0",
--   opts = {
--     adapters = {
--       http = {
--         ["llama.cpp"] = function()
--           return require("codecompanion.adapters").extend("openai_compatible", {
--             env = {
--               -- make sure that llama docker is running
--               url = "http://127.0.0.1:11434",
--               api_key = "TERM",
--               chat_url = "/v1/chat/completions",
--             },
--             schema = {
--               model = {
--                 default = "llama3.1:8b",
--               },
--             },
--             handlers = {
--               parse_message_meta = function(self, data)
--                 local extra = data.extra
--                 if extra and extra.reasoning_content then
--                   data.output.reasoning = { content = extra.reasoning_content }
--                   if data.output.content == "" then
--                     data.output.content = nil
--                   end
--                 end
--                 return data
--               end,
--             },
--           })
--         end,
--       },
--     },
--     interactions = {
--       chat = {
--         adapter = "llama.cpp",
--       },
--       inline = {
--         adapter = "llama.cpp",
--       },
--     },
--   },
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-treesitter/nvim-treesitter",
--   },
-- }

return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  opts = {
    adapters = {
      acp = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            env = {
              CLAUDE_CODE_OAUTH_TOKEN = claude_code_oauth_token,
            },
          })
        end,
      },
    },

    interactions = {
      chat = {
        adapter = "claude_code",
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
