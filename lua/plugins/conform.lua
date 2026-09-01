return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd   = { "ConformInfo" },
    opts  = {
        formatters = {
            prettier = {
                command = vim.fn.expand("$USERPROFILE") .. "\\AppData\\Roaming\\npm\\prettier.cmd",
            },
            stylua = {
                command = vim.fn.expand("$USERPROFILE") .. "\\AppData\\Local\\nvim-data\\mason\\bin\\stylua.cmd",
            },
            clang_format = {
                command = "C:/msys64/mingw64/bin/clang-format.EXE",
            },
        },
        formatters_by_ft = {
            javascript      = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescript      = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            json            = { "prettierd", "prettier", stop_after_first = true },
            html            = { "prettierd", "prettier", stop_after_first = true },
            css             = { "prettierd", "prettier", stop_after_first = true },
            markdown        = { "prettierd", "prettier", stop_after_first = true },
            lua             = { "stylua" },
            c               = { "clang_format" },
        },
        format_on_save = {
            timeout_ms   = 500,
            lsp_fallback = true,
        },
    },
}
