-- Editor plugins

return {
    -- Telescope (fuzzy finder)
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')

            telescope.setup({
                defaults = {
                    prompt_prefix = "🔍 ",
                    selection_caret = "❯ ",
                    mappings = {
                        i = {
                            ['<C-u>'] = false,
                            ['<C-d>'] = false,
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                        },
                    },
                    layout_config = {
                        horizontal = {
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                },
                pickers = {
                    find_files = {
                        find_command = { 'rg', '--files', '--hidden', '--glob', '!.git' },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            })

            telescope.load_extension('fzf')

            -- Keymaps
            local keymap = vim.keymap.set
            keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fichiers' })
            keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Grep' })
            keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })
            keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Aide' })
            keymap('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Récents' })
            keymap('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Commandes' })
            keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Keymaps' })
            keymap('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Recherche buffer' })
            keymap('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Diagnostics' })
            keymap('n', '<leader>fm', '<cmd>Telescope marks<cr>', { desc = 'Marques' })
            keymap('n', '<leader>fp', '<cmd>Telescope projects<cr>', { desc = 'Projets' })
        end,
    },

    -- Git signs
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = { text = '│' },
                    change = { text = '│' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked = { text = '┆' },
                },
                signcolumn = true,
                numhl = false,
                linehl = false,
                word_diff = false,
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = false,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol',
                    delay = 1000,
                    ignore_whitespace = false,
                },
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil,
                max_file_length = 40000,
                preview_config = {
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1,
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = 'Hunk suivant' })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = 'Hunk précédent' })

                    -- Actions
                    map('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage hunk' })
                    map('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })
                    map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = 'Stage hunk' })
                    map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = 'Reset hunk' })
                    map('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
                    map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
                    map('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
                    map('n', '<leader>gp', gs.preview_hunk, { desc = 'Preview hunk' })
                    map('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = 'Blame ligne' })
                    map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'Toggle blame' })
                    map('n', '<leader>gd', gs.diffthis, { desc = 'Diff this' })
                    map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = 'Diff this ~' })
                    map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'Toggle deleted' })
                end,
            })
        end,
    },

    -- Auto pairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            local npairs = require('nvim-autopairs')
            npairs.setup({
                check_ts = true,
                ts_config = {
                    lua = { 'string' },
                    javascript = { 'template_string' },
                },
                disable_filetype = { 'TelescopePrompt', 'vim' },
                fast_wrap = {
                    map = '<M-e>',
                    chars = { '{', '[', '(', '"', "'" },
                    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                    end_key = '$',
                    keys = 'qwertyuiopzxcvbnmasdfghjkl',
                    check_comma = true,
                    highlight = 'Search',
                    highlight_grey = 'Comment',
                },
            })

            -- Integration avec nvim-cmp
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,
    },

    -- Comment
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                padding = true,
                sticky = true,
                ignore = nil,
                toggler = {
                    line = 'gcc',
                    block = 'gbc',
                },
                opleader = {
                    line = 'gc',
                    block = 'gb',
                },
                extra = {
                    above = 'gcO',
                    below = 'gco',
                    eol = 'gcA',
                },
                mappings = {
                    basic = true,
                    extra = true,
                },
                pre_hook = nil,
                post_hook = nil,
            })
        end,
    },

    -- Surround
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- Todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({
                signs = true,
                sign_priority = 8,
                keywords = {
                    FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                    TODO = { icon = " ", color = "info" },
                    HACK = { icon = " ", color = "warning" },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                },
            })

            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "TODO suivant" })

            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "TODO précédent" })

            vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "TODO list" })
        end,
    },

    -- Terminal
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.4
                    end
                end,
                open_mapping = [[<c-\>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                terminal_mappings = true,
                persist_size = true,
                persist_mode = true,
                direction = 'float',
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = 'curved',
                    winblend = 0,
                },
            })

            -- Keymaps
            vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Terminal flottant' })
            vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>',
                { desc = 'Terminal horizontal' })
            vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>',
                { desc = 'Terminal vertical' })

            -- Terminal keymaps
            function _G.set_terminal_keymaps()
                local opts = { buffer = 0 }
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            end

            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end,
    },
}
