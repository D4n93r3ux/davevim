local M = {}

M.config = function()
  local settings = {
    highlight_hovered_item = false,
    show_guides = true,
    auto_preview = false,
    position = "right",
    relative_width = true,
    width = 25,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = "Pmenu",
    autofold_depth = nil,
    auto_unfold_hover = true,
    fold_markers = { "", "" },
    wrap = false,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
      close = { "<Esc>", "q", "<Leader>c", "go" },
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<C-space>",
      toggle_preview = "K",
      rename_symbol = "r",
      code_actions = "a",
      fold = "h",
      unfold = "l",
      fold_all = "H",
      unfold_all = "L",
      fold_reset = "R",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
      -- From lsp-kind
      Method = { icon = "", hl = "@method" },
      Function = { icon = "", hl = "@function" },
      Constructor = { icon = "", hl = "@constructor" },
      Field = { icon = "ﰠ", hl = "@field" },
      Variable = { icon = "", hl = "@variable" }, -- or TSConstant?
      Class = { icon = "ﴯ", hl = "@type" },
      Interface = { icon = "", hl = "@type" },
      Module = { icon = "", hl = "@namespace" },
      Property = { icon = "ﰠ", hl = "@property" }, -- or TSMethod?
      Enum = { icon = "", hl = "@type" },
      File = { icon = "", hl = "@text.uri" },
      EnumMember = { icon = "", hl = "@field" },
      Constant = { icon = "", hl = "@constant" },
      Struct = { icon = "פּ", hl = "@type" },
      Event = { icon = "", hl = "@type" },
      Operator = { icon = "", hl = "@operator" },
      TypeParameter = { icon = "𝙏", hl = "@parameter" },

      -- From mortepau/codicons.nvim
      Namespace = { icon = "", hl = "@namespace" },
      Package = { icon = "", hl = "@namespace" },
      String = { icon = "", hl = "@string" },
      Number = { icon = "", hl = "@number" },
      Boolean = { icon = "", hl = "@boolean" },
      Array = { icon = "", hl = "@constant" },
      Object = { icon = "", hl = "@type" },
      Key = { icon = "", hl = "@type" },
      Null = { icon = "", hl = "@type" },
    },
  }

  local status_ok, symbols_outline = pcall(require, "symbols-outline")
  if not status_ok then
    print("Failed to require symbols-outline")
    return
  end

  symbols_outline.setup(settings)
end

return M
