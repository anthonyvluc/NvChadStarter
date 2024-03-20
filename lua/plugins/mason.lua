local plugins = {
    -- Use Mason as a language server package manager
    -- 1) Add more options here
    --    :Mason to see more installation options
    -- 2) Add the language server option to ../configs/lspconfig.lua
    -- 3) Run the following to install all
    --    nvim +MasonInstallAll
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "codelldb",
                -- "astro-language-server",
                -- "bash-language-server",
                -- "docker-compose-language-service",
                -- "lua-language-server",
                -- "emmet-language-server",
                -- "elixir-ls",
                -- "eslint-lsp",
                -- "gopls",
                -- "html-lsp",
                -- "mdx-analyzer",
                -- "prettier",
                -- "rust-analyzer",
                -- "pyright",
                -- "stylua",
                -- "svelte-language-server",
                -- "tailwindcss-language-server",
                -- "terraform-ls",
            },
        },
    },
}

return plugins
