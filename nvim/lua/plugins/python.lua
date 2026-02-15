return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { enabled = false },
        basedpyright = {
          enabled = true,
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "off",
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
