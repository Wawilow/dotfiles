return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    animate = {
      enabled = false,
    },
    explorer = {
      trash = false,
      replace_netrw = true,

      follow_cwd = true,
      focus = "list",
      ignored = false,
      hidden = true,
    },
    picker = {
      sources = {
        explorer = {
          focus = "list",
          hidden = true,
          ignored = false,
        },
      },
    },
    styles = {
      input = {
        relative = "editor",
        row = 0,
      },
    },
  },
}
