return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {
      trash = false,
      replace_netrw = false,

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
          -- layout = {
          --   layout = {
          --     backdrop = false, -- makes it look less like a "popup"
          --   },
          -- },
        },
      },
    },
  },
}
