return {
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "neovim/nvim-lspconfig", enabled = false },
  { "mfussenegger/nvim-lint", enabled = false },
  { "stevearc/conform.nvim", enabled = false },
  { "blink.cmp", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  
  {
    enabled = false,
    "folke/flash.nvim",
    --@type Flash.Config
    opts = {
      search = {
        foward = true,
        multi_window = false,
        wrap = false,
        incremental = true,
      },
    },
  },


}
