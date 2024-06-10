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
      local on_attach = function(_, _)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
        vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, {})
      end
      local lc = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lc.texlab.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lc.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
}
