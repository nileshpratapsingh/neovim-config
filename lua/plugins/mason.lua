return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "pyright" },
    },
  },
}
