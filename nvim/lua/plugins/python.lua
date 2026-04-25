return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
        ruff = {
          init_options = {
            settings = {
              lint = {
                ignore = { "F541" },
              },
              run = "onSave",
            },
          },
        },
        ty = {
          -- https://docs.astral.sh/ty/reference/editor-settings/#configuration
          enabled = true,
          configuration = {
            rules = {
              ["unresolved-reference"] = "warn",
              ["unresolved-attribute"] = "warn",
            },
          },
        },
      },
    },
  },
}
