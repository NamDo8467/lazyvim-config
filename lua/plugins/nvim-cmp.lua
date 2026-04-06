return {
    "hrsh7th/cmp-cmdline",
    dependencies = { "hrsh7th/nvim-cmp" },
    event = "cmdlineenter",
    config = function()
        local cmp = require("cmp")

        cmp.setup.cmdline(":", {
            mapping = {
                ["<tab>"] = {
                    c = function()
                        if cmp.visible() then
                            -- local entry = cmp.get_selected_entry()
                            -- if entry then
                            --     cmp.confirm({ select = true })
                            -- else
                            cmp.select_next_item()
                            -- end
                        else
                            cmp.complete()
                        end
                    end,
                },
                ["<s-tab>"] = {
                    c = function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            cmp.complete()
                        end
                    end,
                },
                ["<cr>"] = {
                    c = cmp.mapping.confirm({ select = false }),
                },
                ["<c-e>"] = {
                    c = cmp.mapping.close(),
                },
            },
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" },
            }),
            completion = {
                completeopt = "menu,menuone,noselect",
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            completion = {
                completeopt = "menu,menuone,noselect",
            },
            mapping = cmp.mapping.preset.cmdline({
                ["<cr>"] = cmp.mapping.confirm({ select = true }), -- select = true auto-picks first
                ["<tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif cmp.get_selected_entry() == nil then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "c" }),
                ["<s-tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        cmp.complete()
                    end
                end, { "c" }),
            }),
            sources = {
                { name = "buffer" },
            },
        })
    end,
}
