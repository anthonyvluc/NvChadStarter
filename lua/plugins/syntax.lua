local plugins = {
  -- Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "bash",
        "go",
        "rust",
        "python",
        "typescript",
        "tsx",
        "cpp",
        "c",
        "ruby",
        "elixir",
        "markdown",
        "csv",
        "json",
        "dockerfile",
        "angular",
        "erlang",
        "graphql",
        "latex",
        "prisma",
        "regex",
        "yaml",
        "tmux",
        "gitignore"
      },
    },
  },
  -- Language server
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- Use Mason as a language server package manager
  --:Mason to see more installation options
  --nvim +MasonInstallAll
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "rust-analyzer",
        "stylua"
      },
    },
  },
  -- Autoformat on save
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  }
}

return plugins
