-- file structure windonw <L> + o
return {
  "hedyhli/outline.nvim",
  keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
  cmd = "Outline",
  opts = function()
    local defaults = require("outline.config").defaults
    local opts = {
      symbols = {
        icons = {},
        filter = vim.deepcopy(LazyVim.config.kind_filter),
      },
      keymaps = {
        up_and_jump = "<up>",
        down_and_jump = "<down>",
      },
      providers = {
        priority = { "lsp", "coc", "markdown", "norg" },
        lsp = {
          blacklist_clients = {},
        },
      },
      outline_items = {
        show_symbol_details = true,
        show_symbol_lineno = true,
      },
      outline_window = {
        position = "right",
        relative_width = true,
        width = 15,
      },
    }

    for kind, symbol in pairs(defaults.symbols.icons) do
      opts.symbols.icons[kind] = {
        icon = LazyVim.config.icons.kinds[kind] or symbol.icon,
        hl = symbol.hl,
      }
    end
    return opts
  end,
}
