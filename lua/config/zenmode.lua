local M = {}

local c = require("colorschemes.davedark.themes.default")
local config = require("user_config")

local status_ok, zenmode = pcall(require, "zen-mode")
if not status_ok then
  print("Failed to require zen-mode")
  return
end

local settings = {
  window = {
    height = 0.9,
    width = 100,
    options = {},
  },
  plugins = {
    gitsigns = { enabled = true },
  },
  -- ZenMode seems to use the popup menu background, so this is a workaround
  on_open = function()
    local bg = config.transparent_background and c.none or c.bg
    vim.cmd("highlight Pmenu guibg=" .. bg)
  end,
  on_close = function()
    local pmenu_bg = config.pmenu_transparent_background and c.none or c.pmenu_bg
    vim.cmd("highlight Pmenu guibg=" .. (pmenu_bg or "none"))
  end,
}

M.config = function()
  zenmode.setup(settings)
end

return M
