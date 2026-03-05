return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { enabled = false },
        python = {
          analysis = {
            ignore = { "*" },
          },
        },
        basedpyright = {
          enabled = true,
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
            },
          },
        },
      },
    },
  },
}
