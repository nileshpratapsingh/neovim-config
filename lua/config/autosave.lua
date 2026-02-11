
-- Auto-save on every change
local autosave_group = vim.api.nvim_create_augroup("AutoSave", { clear = true })

vim.api.nvim_create_autocmd(
{ "TextChanged", "TextChangedI", "InsertLeave" },
    {
        group = autosave_group,
        callback = function()
            -- Only save if file is modifiable and has a name
            if vim.bo.modifiable
                and vim.bo.modified
                and vim.fn.expand("%") ~= ""
                and vim.bo.buftype == "" then
                vim.cmd("silent! write")
            end
        end,
    }
)
