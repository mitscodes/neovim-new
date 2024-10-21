return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          -- Key mappings for Gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          map("n", "]c", gs.next_hunk, { desc = "Next Change" })
          map("n", "[c", gs.prev_hunk, { desc = "Previous Change" })
          map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
          map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage" })
          map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
        end,
      })
    end,
  },
  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Neogit", -- Lazy load on :Neogit command
    config = function()
      require("neogit").setup({
        integrations = { diffview = true },
      })
      vim.keymap.set("n", "<leader>gs", ":Neogit<CR>", { desc = "Open Neogit" })
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose" }, -- Lazy load on :Diffview command
  },
}
