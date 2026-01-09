return {
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,

        opts = function(_, opts)
            opts.dashboard = {
                width = 55,
                row = nil, -- dashboard position. nil for center
                col = nil, -- dashboard position. nil for center
                pane_gap = 2, -- empty columns between vertical panes
                autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
                -- These settings are used by some built-in sections
                preset = {
                    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
                    ---@type fun(cmd:string, opts:table)|nil
                    pick = nil,
                    -- Used by the `keys` section to show keymaps.
                    -- Set your custom keymaps here.
                    -- When using a function, the `items` argument are the default keymaps.
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        {
                            icon = " ",
                            key = "f",
                            desc = "Find File",
                            action = ":lua Snacks.dashboard.pick('files')",
                        },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        {
                            icon = " ",
                            key = "g",
                            desc = "Find Text",
                            action = ":lua Snacks.dashboard.pick('live_grep')",
                        },
                        {
                            icon = " ",
                            key = "r",
                            desc = "Recent Files",
                            action = ":lua Snacks.dashboard.pick('oldfiles')",
                        },
                        {
                            icon = " ",
                            key = "c",
                            desc = "Config",
                            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                        },
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        {
                            icon = "󰒲 ",
                            key = "L",
                            desc = "Lazy",
                            action = ":Lazy",
                            enabled = package.loaded.lazy ~= nil,
                        },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                    -- Used by the `header` section
                    header = [[
 ██████╗  █████╗ ██████╗ ███████╗██████╗ ██████╗ 
██╔═████╗██╔══██╗╚════██╗╚════██║╚════██╗╚════██╗
██║██╔██║╚█████╔╝ █████╔╝    ██╔╝ █████╔╝ █████╔╝
████╔╝██║██╔══██╗██╔═══╝    ██╔╝ ██╔═══╝  ╚═══██╗
╚██████╔╝╚█████╔╝███████╗   ██║  ███████╗██████╔╝
 ╚═════╝  ╚════╝ ╚══════╝   ╚═╝  ╚══════╝╚═════╝ 
                ]],
                },
                sections = {
                    --                     {
                    --                         pane = 1,
                    --                         height = 20, -- ← only this and text are safe
                    --                         text = [[
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⣤⣶⣾⣿⣷⣦⡀
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣷
                    -- ⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡇
                    --    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣿⣿⣿⣿⣿⣿⣏⡟⠁
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⠃⠄
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⡿⠏⠰
                    -- ⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣎⠀
                    -- ⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣶⣬⣀
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⡿⣟⠛⠏⡟⠿⢻⡟⡻⡿⣿⣿⣿⣷⣦⣤⡀
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⡔⣔⣭⣶⣷⣿⣷⣾⣧⣥⣐⣨⣿⣿⣿⣿⣿⣷⡄
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠉⠉⠉⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⡀
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡈⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣈⣀⠴⠋⢻⣿⠟⠁⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢠⣿⣿⣿⣿⣿⣿⣿⡿⠉⠻⣿⣿⣿⣿⣿⣷⡀
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣧⡮⠋⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⡇⢀⣾⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠙⢿⣿⣿⣿⣿⡇
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣏⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⡟⠀⣼⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⢠⣿⣿⣿⣿⡇
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣇⣶⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⣾⣿⣿⣿⡿
                    -- ⠀ ⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣼⣿⣿⣿⡿
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣦⠀⠀⠀⠀⠿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣼⣿⣿⣿⡟
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⡷⠀⠄⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣉⠃⢤⣤⣾⣿⣿⣿⠏
                    -- ⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠙⠻⠟⠁⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡍⣿⣿⣿⡟⠁
                    -- ⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡸⠟⠁
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏
                    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
                    --                         ]],
                    --                         padding = 0,
                    --                     },
                    {
                        section = "terminal",
                        cmd = "ascii-image-converter D:/CR7/cr7_ss16.jpg -C -b -d 45,25",
                        height = 27,
                        padding = 1,
                    },
                    -- RIGHT PANE – unchanged
                    {
                        pane = 2,
                        { section = "header", gap = 1, align = "center" },
                        { section = "keys", gap = 1, padding = 1 },
                        { section = "startup", gap = 1, align = "center" },
                        pane_gap = 4,
                    },
                },
            }

            return opts
        end,
    },
}
