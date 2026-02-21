return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "tsserver", "pyright" },
    },
  },
}
