return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy load on buffer events
  config = function()
    require("ibl").setup({
      indent = { char = "┊" }, -- Thinner and more subtle line
      scope = { show_start = false, show_end = false },
      exclude = { -- Exclude specific file types
        filetypes = { "help", "dashboard", "NvimTree", "packer" },

      },
    })

    -- Set a lighter color for the indent line
    vim.cmd([[highlight IndentBlanklineChar guifg=#2E2E2E gui=nocombine]])
  end,
}

