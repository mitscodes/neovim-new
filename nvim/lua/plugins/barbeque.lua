return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  event = { "BufWinEnter", "BufNewFile" },
  dependencies = {
    { "SmiteshP/nvim-navic",         lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  opts = {
    show_modified = true,
    exclude_filetypes = { "gitcommit", "markdown" },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
      end,
    })
  end,
}

