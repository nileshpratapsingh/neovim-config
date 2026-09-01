return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")

      -- 👇 THIS LINE IS IMPORTANT
      require("luasnip.loaders.from_lua").load({
        paths = "~/.config/nvim/lua/snippets",
      })
    end,
  },
}
