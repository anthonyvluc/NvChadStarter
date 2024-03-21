local plugins = {
    --
    -- Debugging
    --
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        dependencies = {
            "suketa/nvim-dap-ruby",
        },
        config = function()
            local dap = require("dap")
            --
            -- Ruby
            --
            require("dap-ruby").setup()
            --
            -- C++
            --
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    -- Must be absolute path
                    command = "/Users/anthonyluc/.local/share/nvim/mason/bin/codelldb",
                    args = { "--port", "${port}" },
                },
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
            dap.configurations.c = dap.configurations.cpp
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        ft = "python",
        config = function(_, _)
            require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        version = "^4",
        ft = "rust",
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        ft = "go",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end,
    },
}

return plugins
