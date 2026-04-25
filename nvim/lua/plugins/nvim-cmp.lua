-- auto completion
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.performance = {
      debounce = 0,
      throttle = 0,
      fetching_timeout = 200,
    }
  end,
}
