return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          offset_encoding = "utf-16",
          init_options = {
            settings = {
              lint = {
                ignore = { "F541" },
              },
              run = "onSave",
            },
          },
        },
        pyrefly = {
          enabled = true,
          offset_encoding = "utf-16",
          configuration = {},
        },
        ty = {
          -- https://docs.astral.sh/ty/reference/editor-settings/#configuration
          enabled = false,
          configuration = {
            rules = {
              ["unresolved-reference"] = "warn",
              ["unresolved-attribute"] = "warn",
            },
          },
        },

        -- legacy
        pyright = { enabled = false },
        basedpyright = {
          -- enabled = true,
          enabled = false,
          disableOrganizeImports = true,
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "off",
                diagnosticMode = "openFilesOnly",
                exclude = {
                  "**/node_modules",
                  "**/__pycache__",
                  "**/env",
                  "**/.env",
                  "**/site-packages",
                  "**/build",
                  "**/dist",
                  "**/.eggs",
                  "**/*.egg-info",
                  "**/.pytest_cache",
                  "**/.mypy_cache",
                  "**/.ruff_cache",
                  "**/.git",
                },
              },
            },
          },
        },
      },
    },
  },
}
