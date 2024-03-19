local plugins = {
  --
  -- Debugging
  --
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    "mrcjkb/rustaceanvim",
    dependencies = "mfussenegger/nvim-dap",
    version = '^4',
    ft = "rust",
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = "mfussenegger/nvim-dap",
    ft = "go",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end
  },
}

return plugins
