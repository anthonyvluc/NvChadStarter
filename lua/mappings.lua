require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
    require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

--
-- Personal mappings
--  See options via
--  :h vim.keymap.set()

--
-- Debugging
--
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dB", function()
    require("dap").clear_breakpoints()
end, { desc = "Clear breakpoints" })
map("n", "<leader>dc", ":DapContinue <CR>", { desc = "Continue" })
map("n", "<leader>dsn", ":DapStepOver <CR>", { desc = "Step over" })
map("n", "<leader>dso", ":DapStepOut <CR>", { desc = "Step out" })
map("n", "<leader>dsi", ":DapStepIn <CR>", { desc = "Step in" })
map("n", "<leader>duo", function()
    require("dapui").open()
end, { desc = "Open debug UI" })
map("n", "<leader>duc", function()
    require("dapui").close()
end, { desc = "Close debug UI" })

--
-- Go Debugging
--
map("n", "<leader>dgt", function()
    require("dap-go").debug_test()
end, { desc = "Debug go test" })
map("n", "<leader>dgl", function()
    require("dap-go").debug_last()
end, { desc = "Debug last go test" })
--
-- Python Debugging
--
map("n", "<leader>dpt", function()
    require("dap-python").test_method()
end, { desc = "Debug python test" })
--
-- Rust Debugging
--
map("n", "<leader>dr", function()
    vim.cmd.RustLsp("debuggables")
end, { desc = "Debug rust" })
--
-- C++ Debugging
--
-- map("n", "<leader>dc", function()
--     vim.cmd.RustLsp("debuggables")
-- end, { desc = "Debug cpp" })
