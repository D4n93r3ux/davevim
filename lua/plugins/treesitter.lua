local M = {}

local settings = {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true
  },
  indent = { enable = true, disable = { "" }},
  rainbow = {
    enable = true,
    colors = {
      -- Color test: { { { { { { { } } } } } } }
      "#ffd700",                          -- Gold
      "#da70d6",                          -- Orchid
      "#87cefa",                          -- LightSkyBlue
      "#fa8072",                          -- Salmon
      "#7cf800",                          -- LawnGreen
      "#ff8c00",                          -- DarkOrange
      "#fff8dc"                           -- Cornsilk
    }
  }
}

M.config = function()
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    print "Failed to load treesitter.configs"
  end

  configs.setup(settings)
end

return M
