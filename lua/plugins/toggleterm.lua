return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 12
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.33
      end
    end,
    highlights = {
      FloatBorder = {
        link = "FloatBorder",
      },
    },
    shade_terminals = false,
    -- open_mapping = "<Leader>#",
    direction = "vertical",
    -- direction = "float",
    float_opts = {
      border = "curved",
    },
  },
}
