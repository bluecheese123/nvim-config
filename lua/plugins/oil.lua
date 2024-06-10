return {

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    disabled = true,

    config = function()
      require("oil").setup()
    end,
  },
}
