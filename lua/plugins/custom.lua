return {
  -- Telescope (LazyVim already has telescope, but this is ok)
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  -- Transparency
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = true,
      })
    end,
  },

  -- Noice
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      messages = {
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },
    },
},
}
