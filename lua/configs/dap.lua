local ok_dap, dap = pcall(require, "dap")
if not ok_dap then
  return
end

local ok_dapui, dapui = pcall(require, "dapui")
if not ok_dapui then
  return
end

local ok_dappy, dappy = pcall(require, "dap-python")
if not ok_dappy then
  return
end

local map = vim.keymap.set

local function get_python_path()
  local cwd = vim.fn.getcwd()

  if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    return cwd .. "/.venv/bin/python"
  end

  local poetry = vim.fn.system("poetry env info -p 2>/dev/null"):gsub("\n", "")
  if poetry ~= "" then
    return poetry .. "/bin/python"
  end

  return vim.fn.exepath("python3") or "python"
end

dapui.setup()

dappy.setup(get_python_path())
dappy.test_runner = "pytest"

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Avoid F-keys for now
map("n", "<leader>dc", function() dap.continue() end, { desc = "DAP continue" })
map("n", "<leader>do", function() dap.step_over() end, { desc = "DAP step over" })
map("n", "<leader>di", function() dap.step_into() end, { desc = "DAP step into" })
map("n", "<leader>dO", function() dap.step_out() end, { desc = "DAP step out" })
map("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "DAP breakpoint" })
map("n", "<leader>du", function() dapui.toggle() end, { desc = "DAP UI toggle" })
map("n", "<leader>dt", function() dappy.test_method() end, { desc = "Debug test method" })
map("n", "<leader>dT", function() dappy.test_class() end, { desc = "Debug test class" })
