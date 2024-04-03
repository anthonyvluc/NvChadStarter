local js_based_languages = {
    "typescript",
    "javascript",
    "vue",
}

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
                    command = vim.env.HOME .. "/.local/share/nvim/mason/bin/codelldb",
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
            --
            -- Elixir
            --
            dap.adapters.mix_task = {
                type = "executable",
                command = vim.env.HOME .. "/.local/share/nvim/mason/bin/elixir-ls-debugger",
                args = {},
            }
            dap.configurations.elixir = {
                {
                    type = "mix_task",
                    name = "mix test",
                    task = "test",
                    taskArgs = { "--trace" },
                    request = "launch",
                    startApps = true, -- for Phoenix projects
                    projectDir = "${workspaceFolder}",
                    requireFiles = {
                        "test/**/test_helper.exs",
                        "test/**/*_test.exs",
                    },
                },
            }
            --
            -- Typescript/Javascript
            --
            -- dap.adapters["pwa-node"] = {
            --     type = "server",
            --     host = "localhost",
            --     port = "${port}",
            --     executable = {
            --         command = "node",
            --         args = { vim.env.HOME .. "/.local/share/nvim/mason/bin/js-debug-adapter", "${port}" },
            --     },
            -- }
            for _, language in ipairs(js_based_languages) do
                dap.configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Debug single nodejs files",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                        sourceMaps = true,
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach to nodejs process (npm run dev --inspect)",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                        sourceMaps = true,
                    },
                    {
                        type = "pwa-chrome",
                        request = "launch",
                        name = "Launch & Debug Chrome",
                        url = function()
                            local co = coroutine.running()
                            return coroutine.create(function()
                                vim.ui.input({
                                    prompt = "Enter URL: ",
                                    default = "http://localhost:3000",
                                }, function(url)
                                    if url == nil or url == "" then
                                        return
                                    else
                                        coroutine.resume(co, url)
                                    end
                                end)
                            end)
                        end,
                        webRoot = vim.fn.getcwd(),
                        protocol = "inspector",
                        sourceMaps = true,
                        userDataDir = false,
                    },
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Debug Jest Tests",
                        runtimeExecutable = "node",
                        runtimeArgs = {
                            -- "--inspect-brk",
                            "./node_modules/jest/bin/jest.js",
                            "--runInBand",
                        },
                        rootPath = "${workspaceFolder}",
                        cwd = "${workspaceFolder}",
                        console = "integratedTerminal",
                        internalConsoleOptions = "neverOpen",
                    },
                    -- Divider for the launch.json derived configs
                    {
                        name = "----- ↓ launch.json configs ↓ -----",
                        type = "",
                        request = "launch",
                    },
                }
            end
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
        -- Note for future me
        -- Dont use DapContinue
        -- Just use <leader>dr
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
    {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        ft = js_based_languages,
        config = function()
            require("dap-vscode-js").setup({
                debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
                adapters = {
                    "chrome",
                    "pwa-node",
                    "pwa-chrome",
                    "pwa-msedge",
                    "pwa-extensionHost",
                    "node-terminal",
                },
            })
        end,
    },
    -- {
    --     "Joakker/lua-json5",
    --     build = "./install.sh",
    -- },
}

return plugins
