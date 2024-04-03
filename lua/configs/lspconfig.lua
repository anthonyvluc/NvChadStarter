local configs = require("nvchad.configs.lspconfig")

local servers = {
    --
    -- See list here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    --
    ansiblels = {},
    astro = {},
    bashls = {},
    cssls = {},
    clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
    },
    docker_compose_language_service = {},
    elixirls = {
        cmd = { vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/bin/elixir-ls") },
    },
    emmet_language_server = {},
    eslint = {},
    graphql = {},
    html = {},
    lua_ls = {},
    mdx_analyzer = {},
    ruby_ls = {},
    svelte = {},
    tailwindcss = {},
    terraformls = {},
    tsserver = {
        init_options = {
            preferences = {
                disableSuggestions = true,
            },
        },
    },
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
                    -- https://microsoft.github.io/pyright/#/configuration?id=main-configuration-options
                    autoSearchPaths = true,
                    typeCheckingMode = "basic",
                },
            },
        },
    },
}

for name, opts in pairs(servers) do
    opts.on_init = configs.on_init
    opts.on_attach = configs.on_attach
    opts.capabilities = configs.capabilities

    require("lspconfig")[name].setup(opts)
end

-- Language specific
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.tf", "*.tfvars" },
    callback = function()
        vim.lsp.buf.format()
    end,
})
