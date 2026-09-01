return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "none",
      section_separators = "",
      component_separators = "",
      globalstatus = true,
    },
  },
  config = function(_, opts)
    local dracula = require("lualine.themes.dracula")
    dracula.normal.c.bg   = "none"
    dracula.insert.c.bg   = "none"
    dracula.visual.c.bg   = "none"
    dracula.replace.c.bg  = "none"
    dracula.command.c.bg  = "none"
    dracula.inactive.c.bg = "none"
    opts.options.theme = dracula
    require("lualine").setup(opts)
  end,
}
