return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      float_opts = { border = "rounded", winblend = 10 },
      persist_size = true,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- Function to run the current file with an interactive shell
    local function run_file()
      local filetype = vim.bo.filetype
      local filename = vim.fn.expand("%:t")
      local cmd = ""

      if filetype == "python" then
        cmd = "python3 " .. filename .. " ; bash"
      elseif filetype == "javascript" then
        cmd = "node " .. filename .. " ; bash"
      elseif filetype == "go" then
        cmd = "go run " .. filename .. " ; bash"
      elseif filetype == "c" or filetype == "cpp" then
        cmd = "gcc " .. filename .. " -o output && ./output ; bash"
      elseif filetype == "java" then
        cmd = "javac " .. filename .. " && java " .. vim.fn.expand("%:r") .. " ; bash"
      elseif filetype == "lua" then
        cmd = "lua " .. filename .. " ; bash"
      else
        print("Unsupported file type: " .. filetype)
        return
      end

      Terminal:new({ cmd = cmd, hidden = true }):toggle()
    end

    -- Key mappings for running the current file and managing terminals
    vim.keymap.set("n", "<leader>run", run_file, { desc = "Run File", noremap = true, silent = true })
    vim.keymap.set(
      "n",
      "<leader>th",
      "<cmd>ToggleTerm size=15 direction=horizontal<CR>",
      { desc = "Horizontal Terminal", noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>tv",
      "<cmd>ToggleTerm size=72 direction=vertical<CR>",
      { desc = "Vertical Terminal", noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>tf",
      "<cmd>ToggleTerm direction=float<CR>",
      { desc = "Floating Terminal", noremap = true, silent = true }
    )
  end,
}
