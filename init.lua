vim.env.MAKE = "mingw32-make"
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autosave")
print("Neovim config loaded!")
vim.opt.shell = "powershell.exe"  -- or "pwsh", "bash", etc.


-- Clear package cache to fix loading issues
package.loaded['nvim-treesitter'] = nil
package.loaded['nvim-treesitter.configs'] = nil


-- Ctrl+V paste in insert mode
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })

-- Set <leader> key
vim.g.mapleader = " "

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.cursorline = false
vim.keymap.set("n", "<F2>", ":Ex<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-x>", "v", { noremap = true, silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
-- Set GUI font for Neovide
vim.opt.guifont = "FiraCode Nerd Font:h11"

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_transparent = true
vim.cmd[[colorscheme tokyonight]]

-- Transparent background (colorscheme ke BAAD daalo)
vim.api.nvim_set_hl(0, 'Normal',       { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat',  { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder',  { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatTitle',   { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu',        { bg = 'none' })
vim.api.nvim_set_hl(0, 'PmenuSel',     { bg = 'none' })
vim.api.nvim_set_hl(0, 'PmenuBorder',  { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC',     { bg = 'none' })
vim.api.nvim_set_hl(0, 'SignColumn',   { bg = 'none' })
vim.api.nvim_set_hl(0, 'LineNr',       { bg = 'none' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
vim.api.nvim_set_hl(0, 'StatusLine',   { bg = 'none' })
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'none' })
vim.api.nvim_set_hl(0, 'EndOfBuffer',  { bg = 'none' })

-- vim.opt.statusline = " "
-- vim.api.nvim_set_hl(0, 'StatusLine',   { bg = 'none', fg = 'none' })
-- vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none', fg = 'none' })
-- Railgun / laser cursor
-- vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- vim.g.neovide_cursor_vfx_opacity = 200
-- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
-- vim.g.neovide_cursor_vfx_particle_density = 12
-- vim.g.neovide_cursor_vfx_particle_speed = 20.0
-- vim.g.neovide_cursor_vfx_particle_phase = 1.5
-- vim.g.neovide_cursor_vfx_particle_curl = 1.0
--
-- -- Cursor smoothness
-- vim.g.neovide_cursor_animation_length = 0.05
-- vim.g.neovide_scroll_animation_length = 0.15
-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")



local lspconfig = require("lspconfig")

-- Setup manually for each server
lspconfig.lua_ls.setup({})
lspconfig.tsserver.setup({})
lspconfig.pyright.setup({})

-- fullscreen 
if vim.g.neovide then
    vim.g.neovide_fullscreen = true
    vim.g.neovide_opacity = 0.6
    vim.g.neovide_window_blurred = true
end

-- Set background color via Neovim highlights instead
vim.api.nvim_set_hl(0, "Normal", { bg = "#180326" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#180326" })

-- rename file keymap
vim.keymap.set("n", "<leader>rn", function()
    local old_name = vim.fn.expand("%")
    local new_name = vim.fn.input("New file name: ", old_name)

    if new_name ~= "" and new_name ~= old_name then
        vim.fn.rename(old_name, new_name)
        vim.cmd("edit " .. new_name)
    end
end, { desc = "Rename current file" })

-- Put this in your keymaps file
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { desc = "Format current buffer with Conform" })

-- Neovide font scaling
vim.keymap.set("n", "<C-=>", function()  -- Ctrl + 
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end, { desc = "Increase Neovide font size" })

vim.keymap.set("n", "<C-->", function()  -- Ctrl -
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
    if vim.g.neovide_scale_factor < 0.5 then
        vim.g.neovide_scale_factor = 0.5
    end
end, { desc = "Decrease Neovide font size" })

vim.keymap.set("n", "<F2>", function()
    local netrw_open = false

    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "netrw" then
            netrw_open = true
            -- ✅ only close if it's not the last window
            if #vim.api.nvim_list_wins() > 1 then
                vim.api.nvim_win_close(win, true)
            else
                vim.cmd("bd")  -- close buffer instead if last window
            end
            break
        end
    end

    if not netrw_open then
        vim.cmd("Ex")
    end
end, { desc = "Toggle :Ex" })

vim.keymap.set({ "n", "v" }, "<M-F>", function()
    require("conform").format({
        lsp_fallback = true,
        async        = false,
        timeout_ms   = 500,
    })
end, { desc = "Format file" })
