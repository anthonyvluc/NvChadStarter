local configs = require("nvchad.configs.lspconfig")

local servers = {
    -- astro = {},
    -- bashls = {},
    -- cssls = {},
    -- docker_compose_language_service = {},
    -- elixirls = {},
    -- emmet_language_server = {},
    -- eslint = {},
    -- html = {},
    lua_ls = {},
    -- mdx_analyzer = {},
    -- svelte = {},
    -- tailwindcss = {},
    -- terraformls = {},
    gopls = {
        filetypes = {
            "go",
            "gomod",
            "gowork",
            "gotmpl",
        },
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            },
        },
    },

    pyright = {
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    typeCheckingMode = "basic",
                },
            },
        },
    },

    -- Disabled rust_analyzer since rustaceanvim automatically calls
    -- and handles it.
    -- rust_analyzer = {
    --   settings = {
    --     ["rust-analyzer"] = {},
    --   },
    -- },
}

for name, opts in pairs(servers) do
    opts.on_init = configs.on_init
    opts.on_attach = configs.on_attach
    opts.capabilities = configs.capabilities

    require("lspconfig")[name].setup(opts)
end
