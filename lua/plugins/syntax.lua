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
  --
  -- Language server
  --
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- Use Mason as a language server package manager
  -- 1) Add more options here
  --    :Mason to see more installation options
  -- 2) Add the language server option to ../configs/lspconfig.lua
  -- 3) Run the following to install all
  --    nvim +MasonInstallAll
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "astro-language-server",
  --       "bash-language-server",
  --       "docker-compose-language-service",
  --       "lua-language-server",
  --       "emmet-language-server",
  --       "elixir-ls",
  --       "eslint-lsp",
  --       "gopls",
  --       "html-lsp",
  --       "mdx-analyzer",
  --       "prettier",
  --       "rust-analyzer",
  --       "pyright",
  --       "stylua",
  --       "svelte-language-server",
  --       "tailwindcss-language-server",
  --       "terraform-ls",
  --     },
  --   },
  -- },
  --
  -- Autoformat on save
  --
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "fatih/vim-go",
    ft = "go",
  },
  {
    "tell-k/vim-autopep8",
    ft = "python",
    init = function ()
      vim.g.autopep8_disable_show_diff = 1
      vim.g.autopep8_on_save = 1
    end,
  },
}

return plugins
