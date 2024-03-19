local configs = require "nvchad.configs.lspconfig"

local servers = {
  -- html = {},
  -- cssls = {},
  -- bashls = {},
  -- astro = {},
  -- lua_ls = {},
  gopls = {},
  -- svelte = {},
  -- docker_compose_language_service = {},
  -- emmet_language_server = {},
  -- elixirls = {},
  -- eslint = {},
  -- mdx_analyzer = {},
  -- tailwindcss = {},
  -- terraformls = {},

  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {},
    },
  },

  -- pyright = {
  --   settings = {
  --     python = {
  --       analysis = {
  --         autoSearchPaths = true,
  --         typeCheckingMode = "basic",
  --       },
  --     },
  --   },
  -- },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
