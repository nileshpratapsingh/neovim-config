-- Example plugin config
return {
  "mg979/vim-visual-multi",
  branch = "master",
  config = function()
    vim.g.VM_maps = {
      ["Add Cursor Down"] = "<C-M-j>",
      ["Add Cursor Up"]   = "<C-M-k>",
      ["Select All"]      = "<C-M-n>"
    }
  end
}

