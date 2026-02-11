return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {
          settings = {
            typescript = {
              suggest = { autoImports = true },
            },
            javascript = {
              suggest = { autoImports = true },
            },
          },
        },
      },
    },
  },
}
