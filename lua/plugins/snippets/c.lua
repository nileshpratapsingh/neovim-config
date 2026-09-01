return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local ls = require("luasnip")
            local s = ls.snippet
            local t = ls.text_node
            local i = ls.insert_node

            -- ======================
            -- KEYMAP (REQUIRED)
            -- ======================

            vim.keymap.set({ "i", "s" }, "<Tab>", function()
                if ls.expand_or_jumpable() then
                    return "<Plug>luasnip-expand-or-jump"
                end
                return "<Tab>"
            end, { expr = true, silent = true })

            vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
                if ls.jumpable(-1) then
                    return "<Plug>luasnip-jump-prev"
                end
                return "<S-Tab>"
            end, { expr = true, silent = true })

            -- ======================
            -- C SNIPPET (FIXED)
            -- ======================
            ls.add_snippets("c", {
                s("cmain", {
                    t({ "#include <stdio.h>", "", "void " }),
                    i(1, "function_name"),
          t("("),
          i(2, "data_types"),
          t({ ") {", "    " }),
                    i(3, "// function_code_here"),
                    t({ "", "}", "", "int main() {", "    " }),
                    i(4, "// code here"),
          t({ "", "    return 0;", "}" }),
            }),
      })

      -- ======================
      -- C++ SNIPPET (FIXED)
      -- ======================
      ls.add_snippets("cpp", {
        s("cppmain", {
          t({
            "#include <bits/stdc++.h>",
                    "using namespace std;",
                "",
                "int main() {",
                "    ",
            }),
            i(1, "// code here"),
            t({
                "",
                "    return 0;",
                "}",
            }),
            }),
            })
        end,
    },
}
