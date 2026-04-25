-- plugin to move lines around with shift and arrows, just like in jetbrains
return {
  "nvim-mini/mini.move",
  opts = {
    mappings = {
      left = "<S-left>",
      right = "<S-right>",
      down = "<S-down>",
      up = "<S-up>",

      line_left = "<S-left>",
      line_right = "<S-right>",
      line_down = "<S-down>",
      line_up = "<S-up>",
    },
  },
}
