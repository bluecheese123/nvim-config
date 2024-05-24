return {

  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      --require("luasnip.loaders.from_vscode").load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp.expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim-lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
