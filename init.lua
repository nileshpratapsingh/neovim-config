-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autosave")
print("Neovim config loaded!")
vim.opt.shell = "powershell.exe"  -- or "pwsh", "bash", etc.


-- Clear package cache to fix loading issues
package.loaded['nvim-treesitter'] = nil
package.loaded['nvim-treesitter.configs'] = nil


-- Set <leader> key
vim.g.mapleader = " "

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"

-- Set GUI font for Neovide
vim.opt.guifont = { "FiraCode Nerd Font", ":h14" }  -- h14 = font size 14

vim.opt.termguicolors = true
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_transparent = false
vim.cmd[[colorscheme tokyonight]]

-- Railgun / laser cursor
-- vim.g.neovide_cursor_vfx_mode = "railgun"
-- vim.g.neovide_cursor_vfx_opacity = 200
-- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
-- vim.g.neovide_cursor_vfx_particle_density = 12
-- vim.g.neovide_cursor_vfx_particle_speed = 20.0
-- vim.g.neovide_cursor_vfx_particle_phase = 1.5
-- vim.g.neovide_cursor_vfx_particle_curl = 1.0
--
-- -- Cursor smoothness
-- vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_scroll_animation_length = 0.15

-- Plugins
require("lazy").setup({
  -- Utility
  { "nvim-lua/plenary.nvim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-project.nvim",
  "nvim-telescope/telescope-ui-select.nvim",

  -- LSP Config & Mason
  {
    "williamboman/mason.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("mason").setup()
    end,
  },
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",

  -- Treesitter with safe configuration
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
    -- theme 
    
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
        },
      })
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lua' },
        }),
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          forma = function(entry, vim_item)
            local kind_icons = {
              Text = "", Method = "", Function = "", Constructor = "",
              Field = "", Variable = "", Class = "", Interface = "",
              Module = "", Property = "", Unit = "", Value = "",
              Enum = "", Keyword = "", Snippet = "", Color = "",
              File = "", Reference = "", Folder = "", EnumMember = "",
              Constant = "", Struct = "", Event = "", Operator = "",
              TypeParameter = "",
            }
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind] or '', vim_item.kind)
            vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              nvim_lua = "[Lua]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
        experimental = { ghost_text = true },
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({ { name = 'git' } }, { { name = 'buffer' } })
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
      })
    end,
  },

  -- Transparency plugin
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = {},
        exclude = {},
      })
    end,
  },

  -- Noice (fixed placement)
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        messages = {
          view = "notify",
          view_error = "notify",
          view_warn = "notify",
          view_history = "messages",
          view_search = "virtualtext",
        },
      })
    end,
  },
})

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- Mason LSP setup
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "pyright" },
})

local lspconfig = require("lspconfig")

-- Setup manually for each server
lspconfig.lua_ls.setup({})
lspconfig.tsserver.setup({})
lspconfig.pyright.setup({})
