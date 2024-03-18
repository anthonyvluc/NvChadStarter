local plugins = {
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
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
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
  }
}

return plugins
