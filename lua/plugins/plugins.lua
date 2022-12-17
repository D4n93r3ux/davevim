return {
  -----------------------------------------------------------------------------
  -- General Plugins
  -----------------------------------------------------------------------------

  -- Have Packer manage itself
  { "wbthomason/packer.nvim" },

  -- Auto brackets
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.autopairs").config()
    end,
  },

  -- Shortcuts for bracketing
  { "tpope/vim-surround" },

  -- File explorer
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins.nvimtree").config()
    end,
  },

  -- Zen mode
  {
    "folke/zen-mode.nvim",
    config = function()
      require("plugins.zenmode").config()
    end,
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.comment").config()
    end,
  },

  -- Fix jsx / tsx commenting
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- Tab line
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("plugins.bufferline").config()
    end,
  },

  -- Better buffer deletion
  { "moll/vim-bbye" },

  -- Project management and root folder cd
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins.project").config()
    end,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("plugins.gitsigns").config()
    end,
    setup = function()
      require("core.keymaps").gitsigns()
    end,
    event = "BufRead",
  },

  -- Status line
  {
    "feline-nvim/feline.nvim",
    config = function()
      require("plugins.feline").config()
    end,
  },

  -- Notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugins.notify").config()
    end,
  },

  -- Color preview
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Dashboard
  {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.alpha").config()
    end,
  },

  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins.toggleterm").config()
    end,
  },

  -- Recognise json with comments
  { "neoclide/jsonc.vim" },

  -- Enable working with protected files without sudo-ing
  {
    "lambdalisue/suda.vim",
    config = function()
      require("plugins.suda").config()
    end,
  },

  -- Destroy all buffers that aren't open in windows or tabs
  { "artnez/vim-wipeout" },

  -- Visualise indentation
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent_blankline").config()
    end,
  },

  -- Lots of syntax highlighting improvements
  { "sheerun/vim-polyglot" },

  -- Ruby Signature syntax highlighting
  { "pocke/rbs.vim" },

  -- Automated saving and restoring of views
  { "vim-scripts/restore_view.vim" },

  -- Highlight interesting words
  {
    "lfv89/vim-interestingwords",
    config = function()
      require("plugins.interesting_words").config()
    end,
  },

  -- Better looking folds
  {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require("plugins.pretty_fold").config()
    end,
  },

  -- Editable quickfix window
  { "stefandtw/quickfix-reflector.vim" },

  -- Use lazygit
  { "kdheepak/lazygit.nvim" },

  -- Session management
  {
    "Shatur/neovim-session-manager",
    config = function()
      require("plugins.session").config()
    end,
  },

  -----------------------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------------------

  -- Easy language server, dap, linter and formatter installation
  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.lsp.mason").config()
    end,
  },

  { "williamboman/mason-lspconfig.nvim" },

  -- Language server configuration
  { "neovim/nvim-lspconfig" },

  -- Formatting and linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.lsp.null-ls").config()
    end,
  },

  { "jayp0521/mason-null-ls.nvim" },

  -- Enhanced UI for LSP experience
  {
    "glepnir/lspsaga.nvim",
    config = function()
      require("plugins.lsp.lspsaga").config()
    end,
    branch = "main",
  },

  -- Improved breadcrumbs for status line
  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require("plugins.navic").config()
    end,
  },

  -- TypeScript auto-update imports on file rename
  { "jose-elias-alvarez/typescript.nvim" },

  -- VSCode-style icons in autocompletion window
  { "onsails/lspkind.nvim" },

  -- Highlight other instances of word under cursor
  {
    "RRethy/vim-illuminate",
    config = function()
      require("plugins.illuminate_config").config()
    end,
  },

  -- Diagnostics jump menu
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.trouble").config()
    end,
  },

  -- Function signature help
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("plugins.lsp.lsp_signature").config()
      -- require("lsp_signature").setup({ hint_enable = false })
    end,
  },

  -----------------------------------------------------------------------------
  -- Snippets
  -----------------------------------------------------------------------------

  -- Snippet engine
  { "L3MON4D3/LuaSnip" },

  -- Lots of snippets to start with
  { "rafamadriz/friendly-snippets" },

  -- TypeScript / React snippets
  {
    "dsznajder/vscode-react-javascript-snippets",
    run = "yarn install --frozen-lockfile && yarn compile",
  },

  -- Symfony and Twig snippets
  { "https://github.com/nalabdou/Symfony-code-snippets" },

  -----------------------------------------------------------------------------
  -- Completion
  -----------------------------------------------------------------------------

  -- Completion plugin
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.cmp").config()
    end,
  },

  -- Completion sources
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-calc" },

  -- JSON schema completion
  { "b0o/SchemaStore.nvim" },

  -----------------------------------------------------------------------------
  -- Treesitter and Friends
  -----------------------------------------------------------------------------

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter").config()
    end,
  },

  -- Rainbow brackets
  {
    "p00f/nvim-ts-rainbow",
    requires = { { "nvim-treesitter/nvim-treesitter" } },
    -- Config in config.treesitter.lua
  },

  -- Autotag
  {
    "windwp/nvim-ts-autotag",
    requires = { { "nvim-treesitter/nvim-treesitter" } },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Playground (required for TSHighlightCapturesUnderCursor)
  {
    "nvim-treesitter/playground",
    requires = { { "nvim-treesitter/nvim-treesitter" } },
  },

  -----------------------------------------------------------------------------
  -- Telescope and Extensions
  -----------------------------------------------------------------------------

  -- Telescope / finder
  {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("plugins.telescope").config()
    end,
  },

  -- Fuzzy file finder for Telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  },

  -- File browser
  { "nvim-telescope/telescope-file-browser.nvim" },

  -- Bookmark browser
  { "dhruvmanila/telescope-bookmarks.nvim" },
}