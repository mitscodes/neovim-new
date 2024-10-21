return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
      "rcarriga/nvim-dap-ui",  -- DAP UI for better debugging interface
      "nvim-neotest/nvim-nio", -- Required by nvim-dap-ui

    },
    keys = { "<leader>dc", "<leader>dso", "<leader>db", "<leader>dr" }, -- Lazy load on these keybinds
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Python configuration
      require("dap-python").setup("python")
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
        },
      }

      -- Go configuration
      require("dap-go").setup()
      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          mode = "auto",
          program = "${file}",
        },
      }

      -- Set up DAP UI
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      -- Key mappings for debugging with WhichKey descriptions
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open Debug REPL" })
    end,
  },
}

