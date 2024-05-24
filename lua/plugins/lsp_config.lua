return {

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "texlab" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lc = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lc.texlab.setup({
        capabilities = capabilities,
      })
      lc.lua_ls.setup({
        capabilities = capabilities,
      })
    end,
  },
}
