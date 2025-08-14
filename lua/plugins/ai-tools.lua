-- AI and Cool Tools Configuration

return {
  -- Supermaven (FREE AI autocomplete)
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<M-CR>",  -- Option + Enter
          clear_suggestion = "<M-x>",    -- Option + x
          accept_word = "<M-w>",         -- Option + w pour accepter mot par mot
        },
        ignore_filetypes = {
          help = true,
          gitcommit = true,
          gitrebase = true,
          hgcommit = true,
          svn = true,
          cvs = true,
        },
        color = {
          suggestion_color = "#6c7086",  -- Catppuccin overlay0
          cterm = 244,
        },
        log_level = "warn",
        disable_inline_completion = false,
        disable_keymaps = false,
      })

      -- Keymaps additionnels
      vim.keymap.set('n', '<leader>as', '<cmd>SupermavenToggle<CR>', { desc = 'Toggle Supermaven' })
      vim.keymap.set('n', '<leader>ar', '<cmd>SupermavenRestart<CR>', { desc = 'Restart Supermaven' })
    end,
  },

  -- Vim-fugitive (Git integration)
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
      { "<leader>gg", "<cmd>Git<CR>", desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
      { "<leader>gl", "<cmd>Git pull<CR>", desc = "Git pull" },
      { "<leader>gL", "<cmd>Git log<CR>", desc = "Git log" },
    },
  },

  -- Diffview.nvim (Better git diffs)
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<CR>", desc = "Open diff view" },
      { "<leader>gdc", "<cmd>DiffviewClose<CR>", desc = "Close diff view" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
    },
  },

  -- Trouble.nvim (Better diagnostics list)
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        position = "bottom",
        height = 10,
        icons = true,
        mode = "workspace_diagnostics",
        use_diagnostic_signs = true,
      })
    end,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Toggle Trouble" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document diagnostics" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Location list" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Quickfix list" },
    },
  },

  -- Vim-visual-multi (Multiple cursors)
  {
    "mg979/vim-visual-multi",
    branch = "master",
    keys = {
      { "<C-n>", mode = { "n", "v" } },
      { "<C-Down>", mode = { "n", "v" } },
      { "<C-Up>", mode = { "n", "v" } },
    },
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Subword Under"] = "<C-n>",
        ["Add Cursor Down"] = "<C-Down>",
        ["Add Cursor Up"] = "<C-Up>",
      }
    end,
  },

  -- Harpoon (Quick file navigation)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add to Harpoon" })
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
      vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
      vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
      vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
      vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
    end,
  },

  -- Undotree (Visualize undo history)
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle undo tree" },
    },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  -- Zen Mode (Distraction-free writing)
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 0.95,
          width = 120,
          height = 1,
        },
      })
    end,
    keys = {
      { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
  },

  -- Twilight (Dim inactive code)
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function()
      require("twilight").setup()
    end,
    keys = {
      { "<leader>tw", "<cmd>Twilight<CR>", desc = "Toggle Twilight" },
    },
  },

  -- Neorg (Note-taking and organization)
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      })
    end,
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" },
    },
  },

  -- Rest.nvim (HTTP client)
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "http",
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false,
        result_split_in_place = false,
        skip_ssl_verification = false,
        encode_url = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          show_url = true,
          show_http_info = true,
          show_headers = true,
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
            end
          },
        },
      })
    end,
    keys = {
      { "<leader>rr", "<Plug>RestNvim", desc = "Run REST request" },
      { "<leader>rp", "<Plug>RestNvimPreview", desc = "Preview REST request" },
      { "<leader>rl", "<Plug>RestNvimLast", desc = "Run last REST request" },
    },
  },

  -- Live Server (Live preview for web development)
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = function()
      require("live-server").setup({
        port = 5500,
        browser = "default",
      })
    end,
    keys = {
      { "<leader>ls", "<cmd>LiveServerStart<CR>", desc = "Start Live Server" },
      { "<leader>lS", "<cmd>LiveServerStop<CR>", desc = "Stop Live Server" },
    },
  },
}
