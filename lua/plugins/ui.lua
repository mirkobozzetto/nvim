-- Plugins d'interface utilisateur

return {
    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'catppuccin',
                    component_separators = '|',
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
            })
        end,
    },

    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                    side = "left",
                },
                renderer = {
                    group_empty = true,
                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },
                    },
                },
                filters = {
                    dotfiles = false,
                    custom = { "^.git$", "^node_modules$" },
                },
                git = {
                    enable = true,
                    ignore = false,
                },
                actions = {
                    open_file = {
                        quit_on_open = false,
                        resize_window = true,
                    },
                },
            })

            -- Keymaps
            vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
            vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>', { desc = 'Find current file' })
        end,
    },

    -- Which-key (aide pour les raccourcis)
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup({
                plugins = {
                    marks = true,
                    registers = true,
                    spelling = {
                        enabled = true,
                        suggestions = 20,
                    },
                },
                window = {
                    border = "rounded",
                    position = "bottom",
                    margin = { 1, 0, 1, 0 },
                    padding = { 2, 2, 2, 2 },
                },
                layout = {
                    height = { min = 4, max = 25 },
                    width = { min = 20, max = 50 },
                    spacing = 3,
                    align = "center",
                },
            })

            wk.register({
                ["<leader>"] = {
                    f = { name = "Find" },
                    g = { name = "Git" },
                    l = { name = "LSP" },
                    b = { name = "Buffers" },
                    t = { name = "Terminal/Tabs" },
                    u = { name = "UI Toggle" },
                    c = { name = "Code" },
                    d = { name = "Diagnostic" },
                    w = { name = "Save" },
                    q = { name = "Quit" },
                    e = { name = "Explorer" },
                    r = { name = "REST" },
                    h = { name = "Harpoon" },
                    x = { name = "Trouble" },
                    m = { name = "Markdown" },
                    z = { name = "Zen" },
                },
            })
        end,
    },

    -- Notifications
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#000000",
                render = "default",
                stages = "fade",
                timeout = 3000,
                max_height = function()
                    return math.floor(vim.o.lines * 0.75)
                end,
                max_width = function()
                    return math.floor(vim.o.columns * 0.75)
                end,
            })
            vim.notify = require("notify")
        end,
    },

    -- Indentation guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "│",
                },
                scope = {
                    enabled = true,
                    show_start = true,
                    show_end = false,
                },
            })
        end,
    },

    -- Dashboard
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        config = function()
            local alpha = require('alpha')
            local dashboard = require('alpha.themes.dashboard')

            dashboard.section.header.val = {
                [[       /|                                                ]],
                [[      / |                                                ]],
                [[     /  /                                                ]],
                [[    |   |                                                ]],
                [[   /    |                                                ]],
                [[   |    \_                                               ]],
                [[   |      \__                                            ]],
                [[   \       __\_______                                    ]],
                [[    \                 \_                                 ]],
                [[    | /                 \                                ]],
                [[    \/                   \                               ]],
                [[     |                    |                              ]],
                [[     \                   \|                              ]],
                [[     |                    \                              ]],
                [[     \                     |                             ]],
                [[     /\    \_               \                            ]],
                [[    / |      \__ (   )       \                           ]],
                [[   /  \      / |\\  /       __\____                      ]],
                [[  |  ,     |  /\ \ \__    |       \_                     ]],
                [[   \_/|\___/   \   \}}}\__|  (@)     )                   ]],
                [[    \)\)\)      \_\---\   \|       \ \                   ]],
                [[                  \>\>\>   \   /\__o_o)                  ]],
                [[                            | /  VVVVV                   ]],
                [[                            \ \    \                     ]],
                [[                             \ \MMMMM         oh bugger! ]],
                [[                              \______/         _____ /   ]],
                [[                                              |  O O|    ]],
                [[                                             /___|_|/\_  ]],
                [[                                        ==( |          | ]],
                [[                                             (o)====(o)  ]],
                [[                                                         ]],
                [[                                                         ]],
            }

            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find files", ":Telescope find_files<CR>"),
                dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
                dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
                dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
                dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("l", "  Lazy (plugins)", ":Lazy<CR>"),
                dashboard.button("m", "  Mason (LSP)", ":Mason<CR>"),
                dashboard.button("q", "  Quit", ":qa<CR>"),
            }

            alpha.setup(dashboard.opts)
        end,
    },
}
