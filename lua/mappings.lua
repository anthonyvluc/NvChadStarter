require "nvchad.mappings"

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
map(
    "n",
    "<leader>db",
    "<cmd> DapToggleBreakpoint <CR>",
    { desc = "Add breakpoint at line" }
)
map(
    "n",
    "<leader>dsn",
    "<cmd> DapStepOver <CR>",
    { desc = "Step over" }
)
map(
    "n",
    "<leader>dso",
    "<cmd> DapStepOut <CR>",
    { desc = "Step out" }
)
map(
    "n",
    "<leader>dsi",
    "<cmd> DapStepIn <CR>",
    { desc = "Step in" }
)
map(
    "n",
    "<leader>dus",
    function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
    end,
    { desc = "Open debugging sidebar" }
)

--
-- Go Debugging
--
map(
    "n",
    "<leader>dgt",
    function()
        require('dap-go').debug_test()
    end,
    { desc = "Debug go test" }
)
map(
    "n",
    "<leader>dgl",
    function()
        require('dap-go').debug_last()
    end,
    { desc = "Debug last go test" }
)
