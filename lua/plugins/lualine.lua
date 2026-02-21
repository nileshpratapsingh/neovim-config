return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- important
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "gruvbox",
      section_separators = "",
      component_separators = "",
      globalstatus = true,
    },
  },
}
