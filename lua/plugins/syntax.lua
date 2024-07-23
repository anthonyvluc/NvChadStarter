local plugins = {
    -- Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "angular",
                "bash",
                "c",
                "cpp",
                "css",
                "csv",
                "diff",
                "dockerfile",
                "eex",
                "elixir",
                "erlang",
                "gitignore",
                "go",
                "graphql",
                "heex",
                "html",
                "json",
                "latex",
                "markdown",
                "prisma",
                "python",
                "regex",
                "ruby",
                "rust",
                "terraform",
                "tmux",
                "tsx",
                "typescript",
                "yaml",
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
            require("configs.lspconfig")
        end,
    },
    --
    -- Autoformat on save
    --
    {
        "fatih/vim-go",
        ft = "go",
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        -- NOTE: Using black plugin here but cmd down there uses mason installed black
        -- This is due to the plugin not working with nvim
        "psf/black",
        ft = "python",
        init = function()
            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.py" },
                callback = function()
                    vim.cmd("!black %")
                end,
            })
        end,
    },
    {
        "wesleimp/stylua.nvim",
        ft = "lua",
        init = function()
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*.lua" },
                callback = function()
                    require("stylua").format()
                end,
            })
        end,
    },
    {
        "prettier/vim-prettier",
        ft = { "typescript", "javascript", "html", "css", "scss" },
        init = function()
            vim.api.nvim_command([[autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx,*.html,*.css,*.scss :Prettier]])
            vim.g["prettier#config#print_width"] = 100
        end,
    },
    {
        -- TODO: Not working
        "rhysd/vim-clang-format",
        ft = { "c", "cpp" },
        on_attach = function(_, bufnr)
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end,
    },
    -- Cassandra CQL
    {
        "elubow/cql-vim",
        ft = { "cql" },
    },
}

return plugins
