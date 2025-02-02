return {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        -- https://codecompanion.olimorris.dev/configuration/adapters#configuring-adapter-settings
        require("codecompanion").setup({
            adapters = {
                ollama_deepseek = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "ollama_deepseek",
                        parameters = {
                            sync = true,
                        },
                        schema = {
                            model = {
                                default = "deepseek-coder-v2:latest",
                            },
                            num_ctx = {
                                default = 16384,
                            },
                            num_predict = {
                                default = -1,
                            },
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = "ollama_deepseek",
                },
                inline = {
                    adapter = "ollama_deepseek",
                },
                agent = {
                    adapter = "ollama_deepseek",
                },
            },
        })
    end,
}
