local M = {}

local settings = {
  border_style = "rounded",
  code_action_lightbulb = {
    enable = false,
    sign = false,
    virtual_text = false,
  },
  definition_action_keys = {
    edit = "<CR>",
    vsplit = "<Leader>v",
  },
  show_outline = {
    win_position = "right",
    win_width = 60,
  },
}

M.config = function()
  local status_ok, lspsaga = pcall(require, "lspsaga")
  if not status_ok then
    print("Failed to require lspsaga")
    return
  end

  lspsaga.init_lsp_saga(settings)
end

return M