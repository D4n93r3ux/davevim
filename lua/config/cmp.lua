-------------------------------------------------------------------------------
-- NOTES
--
-- First, a snippet engine must be set - we've installed Luasnip and followed
-- the recommended implementation under the 'snippet' key.
--
-- Completion uses 'sources', which are installed as plugins and referenced
-- in the 'sources' table of cmp settings. Luasnip can also be used as a
-- completion source, although this isn't strictly necessary.
-------------------------------------------------------------------------------

local M = {}

M.config = function()
  -----------------------------------------------------------------------------
  -- Requires
  -----------------------------------------------------------------------------
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  require("luasnip/loaders/from_vscode").lazy_load()

  local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
  end

  -----------------------------------------------------------------------------
  -- Settings
  -----------------------------------------------------------------------------
  local settings = {
    enabled = function()
      local in_syntax_group = require("cmp.config.context").in_syntax_group
      return not in_syntax_group("Comment")
    end,
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- does this work?
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    -- Reorder these to change the order in the popup menu
    sources = cmp.config.sources({
      {
        name = "nvim_lsp",
        keyword_length = 2,
        max_item_count = 10,
        entry_filter = function(entry, _)
          return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
        end,
      },
      { name = "luasnip", max_item_count = 10 },
      { name = "nvim_lua" },
      { name = "buffer", keyword_length = 3, max_item_count = 5 },
      { name = "path" },
      { name = "calc" },
    }),
    sorting = {
      comparators = cmp.config.compare,
    },
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
    window = {
      completion = cmp.config.window.bordered({
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        col_offset = -4,
        side_padding = 0,
      }),
      documentation = cmp.config.window.bordered({
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        col_offset = -4,
        side_padding = 0,
      }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local source_names = {
          nvim_lua = "vim.lsp",
          nvim_lsp = "LSP",
          luasnip = "Luasnip",
          buffer = "Buffer",
          path = "Path",
          calc = "Calc",
          cmdline = "Cmdline",
        }
        local duplicates = {
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
          luasnip = 1,
        }
        local duplicates_default = 0

        local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. strings[1] .. " "

        local source_name = source_names[entry.source.name]
        if not source_name then
          print("No source_name for " .. entry.source.name)
        else
          kind.menu = "    (" .. strings[2] .. ", " .. source_names[entry.source.name] .. ")"
        end

        kind.dup = duplicates[entry.source.name] or duplicates_default

        return kind
      end,
    },
  }

  cmp.setup(settings)

  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
      { name = "cmdline" },
    }),
  })

  cmp.setup.cmdline({ "/", "?" }, {
    sources = {
      { name = "buffer" },
    },
  })
end

return M