-- Configuration LSP

return {
    -- LSP Configuration
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'folke/neodev.nvim',
            'folke/neoconf.nvim',
        },
        config = function()
            -- Setup neoconf & neodev
            require('neoconf').setup()
            require('neodev').setup()

            -- Setup mason
            require('mason').setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            -- Ensure installed servers
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'tsserver',
                    'pyright',
                    'rust_analyzer',
                    'html',
                    'cssls',
                    'jsonls',
                    'eslint',
                },
                automatic_installation = true,
            })

            -- LSP settings
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Diagnostic config
            vim.diagnostic.config({
                virtual_text = {
                    prefix = '●',
                },
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
            })

            -- Sign icons
            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- Border for hover and signature help
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, { border = "rounded" }
            )
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                vim.lsp.handlers.signature_help, { border = "rounded" }
            )

            -- Server configurations
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = {
                                version = 'LuaJIT',
                            },
                            diagnostics = {
                                globals = { 'vim' },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = { enable = false },
                            format = {
                                enable = true,
                                defaultConfig = {
                                    indent_style = "space",
                                    indent_size = "2",
                                },
                            },
                        },
                    },
                },
                tsserver = {
                    settings = {
                        typescript = {
                            format = {
                                indentSize = 2,
                                convertTabsToSpaces = true,
                                semicolons = "remove",
                            },
                        },
                        javascript = {
                            format = {
                                indentSize = 2,
                                convertTabsToSpaces = true,
                                semicolons = "remove",
                            },
                        },
                        completions = {
                            completeFunctionCalls = true,
                        },
                    },
                },
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                autoSearchPaths = true,
                                diagnosticMode = "workspace",
                                useLibraryCodeForTypes = true,
                            },
                        },
                    },
                },
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                            checkOnSave = {
                                command = "clippy",
                            },
                        },
                    },
                },
                html = {},
                cssls = {},
                jsonls = {
                    settings = {
                        json = {
                            schemas = require('schemastore').json.schemas(),
                            validate = { enable = true },
                        },
                    },
                },
                eslint = {
                    settings = {
                        format = {
                            enable = true,
                        },
                    },
                },
            }

            -- Setup servers
            for server, config in pairs(servers) do
                config.capabilities = capabilities
                lspconfig[server].setup(config)
            end

            -- Keymaps on LspAttach
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    local keymap = vim.keymap.set

                    -- Navigation
                    keymap('n', 'gD', vim.lsp.buf.declaration,
                        vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))
                    keymap('n', 'gd', vim.lsp.buf.definition,
                        vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
                    keymap('n', 'gi', vim.lsp.buf.implementation,
                        vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
                    keymap('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'References' }))
                    keymap('n', 'gt', vim.lsp.buf.type_definition,
                        vim.tbl_extend('force', opts, { desc = 'Go to type definition' }))

                    -- Hover
                    keymap('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover documentation' }))
                    keymap('n', '<C-k>', vim.lsp.buf.signature_help,
                        vim.tbl_extend('force', opts, { desc = 'Signature help' }))

                    -- Actions
                    keymap('n', '<leader>lr', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename' }))
                    keymap({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action,
                        vim.tbl_extend('force', opts, { desc = 'Code action' }))
                    keymap('n', '<leader>lf', function()
                        vim.lsp.buf.format { async = true }
                    end, vim.tbl_extend('force', opts, { desc = 'Format' }))

                    -- Workspace
                    keymap('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder,
                        vim.tbl_extend('force', opts, { desc = 'Add workspace folder' }))
                    keymap('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder,
                        vim.tbl_extend('force', opts, { desc = 'Remove workspace folder' }))
                    keymap('n', '<leader>lwl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, vim.tbl_extend('force', opts, { desc = 'List workspace folders' }))

                    -- Diagnostics
                    keymap('n', '<leader>ld', vim.diagnostic.open_float,
                        vim.tbl_extend('force', opts, { desc = 'Line diagnostics' }))
                    keymap('n', '[d', vim.diagnostic.goto_prev,
                        vim.tbl_extend('force', opts, { desc = 'Previous diagnostic' }))
                    keymap('n', ']d', vim.diagnostic.goto_next,
                        vim.tbl_extend('force', opts, { desc = 'Next diagnostic' }))
                    keymap('n', '<leader>lq', vim.diagnostic.setloclist,
                        vim.tbl_extend('force', opts, { desc = 'Diagnostic list' }))
                end,
            })
        end,
    },

    -- JSON schemas
    {
        "b0o/schemastore.nvim",
        lazy = true,
    },

    -- LSP UI enhancements
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                ui = {
                    border = "rounded",
                },
                symbol_in_winbar = {
                    enable = true,
                },
                lightbulb = {
                    enable = false,
                },
            })

            -- Keymaps
            vim.keymap.set("n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })
            vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "Code outline" })
            vim.keymap.set("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover doc" })
        end,
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    javascript = { { "prettierd", "prettier" } },
                    typescript = { { "prettierd", "prettier" } },
                    javascriptreact = { { "prettierd", "prettier" } },
                    typescriptreact = { { "prettierd", "prettier" } },
                    json = { { "prettierd", "prettier" } },
                    html = { { "prettierd", "prettier" } },
                    css = { { "prettierd", "prettier" } },
                    scss = { { "prettierd", "prettier" } },
                    markdown = { { "prettierd", "prettier" } },
                    yaml = { { "prettierd", "prettier" } },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    },
}
