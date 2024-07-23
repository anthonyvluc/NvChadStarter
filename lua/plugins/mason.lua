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
                "ansible-language-server",
                "astro-language-server",
                "bash-language-server",
                "black",
                "codelldb",
                "docker-compose-language-service",
                -- "lua-language-server", -- Manually installed
                "emmet-language-server",
                "elixir-ls",
                "eslint-lsp",
                -- "gopls", -- Manually installed
                "graphql-language-service-cli",
                "html-lsp",
                "js-debug-adapter",
                "mdx-analyzer",
                "prettier",
                "ruby-lsp",
                -- "rust-analyzer",
                -- "pyright",
                -- "stylua", -- Manually installed
                "svelte-language-server",
                "tailwindcss-language-server",
                "terraform-ls",
                "typescript-language-server",
            },
        },
    },
}

return plugins
