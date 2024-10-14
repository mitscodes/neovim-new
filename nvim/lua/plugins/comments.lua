return {
  {
    "numToStr/Comment.nvim",

    event = "BufReadPost",                        -- Lazy load on buffer events
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring", -- For dynamic comment styles
    },
    config = function()
      local comment = require("Comment")

      comment.setup({
        pre_hook = function(ctx)
          -- Context-aware comments using Treesitter
          local U = require("Comment.utils")
          local ts_utils = require("ts_context_commentstring.utils")

          local ts_internal = require("ts_context_commentstring.internal")

          local location
          if ctx.ctype == U.ctype.block then
            location = ts_utils.get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = ts_utils.get_visual_start_location()
          end

          return ts_internal.calculate_commentstring({
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",

            location = location,
          })
        end,
        toggler = {
          line = "<leader>/", -- Toggle line comment
          block = "<leader>/b", -- Toggle block comment
        },
        opleader = {
          line = "<leader>/", -- Operator-pending mode for line comments
          block = "<leader>/b", -- Operator-pending mode for block comments
        },
      })

      -- Key mappings with WhichKey descriptions
      vim.keymap.set(
        "n",
        "<leader>/",
        "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",

        { desc = "Toggle line comment" }
      )
      vim.keymap.set(
        "v",
        "<leader>/",
        "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        { desc = "Toggle comment on selection" }
      )
      vim.keymap.set(
        "n",
        "<leader>/b",
        "<cmd>lua require('Comment.api').toggle.blockwise.current()<CR>",
        { desc = "Toggle block comment" }
      )
    end,
  },
}
