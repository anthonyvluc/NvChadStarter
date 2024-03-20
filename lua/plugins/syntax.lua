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
                "elixir",
                "erlang",
                "gitignore",
                "go",
                "graphql",
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
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "tell-k/vim-autopep8",
        ft = "python",
        init = function()
            vim.g.autopep8_max_line_length = 79
            vim.g.autopep8_disable_show_diff = 1
            vim.g.autopep8_on_save = 1
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
}

return plugins
