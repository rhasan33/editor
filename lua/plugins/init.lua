return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = { icons = {} },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "pyright", "gopls" },
    },
  },
  {
    "zapling/mason-conform.nvim",
    dependencies = { "mason-org/mason.nvim", "stevearc/conform.nvim" },
    opts = {
      ensure_installed = { "black", "goimports", "gofumpt" },
    },
  },
  {
    "mfussenegger/nvim-dap",
  },
  { "nvim-neotest/nvim-nio" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = {
      ensure_installed = { "debugpy", "delve" },
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
    ft = "python",
    config = function()
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(mason_path)
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
    },
    ft = "python", -- Load when opening Python files
    keys = { { ",v", "<cmd>VenvSelect<cr>" } }, -- Open picker on keymap
    opts = {
      options = {}, -- plugin-wide options
      search = {}   -- custom search definitions
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    cmd = { "ClaudeCode", "ClaudeCodeFocus", "ClaudeCodeSend", "ClaudeCodeAdd", "ClaudeCodeDiff" },
    keys = {
      { "<C-,>",       "<cmd>ClaudeCodeFocus<cr>",            desc = "Claude Code",          mode = { "n", "t" } },
      { "<leader>cC",  "<cmd>ClaudeCode --continue<cr>",      desc = "Claude Code Continue", mode = "n" },
      { "<leader>cV",  "<cmd>ClaudeCode --verbose<cr>",       desc = "Claude Code Verbose",  mode = "n" },
      { "<leader>cR",  "<cmd>ClaudeCode --resume<cr>",        desc = "Claude Code Resume",   mode = "n" },
      { "<leader>cs",  "<cmd>ClaudeCodeSend<cr>",             desc = "Claude Code Send",     mode = "v" },
      { "<leader>ca",  "<cmd>ClaudeCodeAdd %<cr>",            desc = "Claude Code Add File", mode = "n" },
    },
    config = function()
      require("configs.claude")
    end,
  }
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
