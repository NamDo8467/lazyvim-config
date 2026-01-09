return {
    "hrsh7th/cmp-cmdline",
    dependencies = { "hrsh7th/nvim-cmp" },
    event = "CmdlineEnter",
    config = function()
        local cmp = require("cmp")

        cmp.setup.cmdline(":", {
            mapping = {
                ["<Tab>"] = {
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
                ["<S-Tab>"] = {
                    c = function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            cmp.complete()
                        end
                    end,
                },
                ["<CR>"] = {
                    c = cmp.mapping.confirm({ select = false }),
                },
                ["<C-e>"] = {
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
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- select = true auto-picks first
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif cmp.get_selected_entry() == nil then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "c" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
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
