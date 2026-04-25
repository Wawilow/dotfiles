-- daily notes plugin :today
return {
  "VVoruganti/today.nvim",
  lazy = false,
  config = function()
    require("today").setup()
  end,
}
