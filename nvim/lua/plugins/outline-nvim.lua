-- file structure windonw <L> + o
return {
  "stevearc/aerial.nvim",
  branch = "nvim-0.11", -- TODO: fix this, it's better to use latest version
  event = "LazyFile",
  opts = function()
    local icons = vim.deepcopy(LazyVim.config.icons.kinds)

    -- HACK: fix lua's weird choice for `Package` for control
    -- structures like if/else/for/etc.
    icons.lua = { Package = icons.Control }

    ---@type table<string, string[]>|false
    local filter_kind = false
    if LazyVim.config.kind_filter then
      filter_kind = assert(vim.deepcopy(LazyVim.config.kind_filter))
      filter_kind._ = filter_kind.default
      filter_kind.default = nil
    end

    local opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      show_guides = true,
      layout = {
        resize_to_content = false,
        win_opts = {
          winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
          signcolumn = "yes",
          statuscolumn = " ",
        },
      },
      icons = icons,
      filter_kind = filter_kind,
      -- stylua: ignore
      guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
    }
    return opts
  end,
  keys = {
    { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    { "<leader>o", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
  },
}

-- return {
--   "hedyhli/outline.nvim",
--   keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
--   cmd = "Outline",
--   opts = function()
--     local defaults = require("outline.config").defaults
--     local opts = {
--       symbols = {
--         icons = {},
--         filter = vim.deepcopy(LazyVim.config.kind_filter),
--       },
--       keymaps = {
--         up_and_jump = "<up>",
--         down_and_jump = "<down>",
--       },
--       providers = {
--         priority = { "lsp", "coc", "markdown", "norg" },
--         lsp = {
--           blacklist_clients = {},
--         },
--       },
--       outline_items = {
--         show_symbol_details = true,
--         show_symbol_lineno = true,
--       },
--       outline_window = {
--         position = "right",
--         relative_width = true,
--         width = 15,
--       },
--     }
--
--     for kind, symbol in pairs(defaults.symbols.icons) do
--       opts.symbols.icons[kind] = {
--         icon = LazyVim.config.icons.kinds[kind] or symbol.icon,
--         hl = symbol.hl,
--       }
--     end
--     return opts
--   end,
-- }
