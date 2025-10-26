-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/conform.nvim',
    opts = {},
    event = "BufReadPre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = function(bufnr)
            local filename = vim.api.nvim_buf_get_name(bufnr)
            if filename:match("whichkey.lua") then
              return {} -- Return empty table to skip all formatters
            end
            return { "stylua" } -- Use stylua for other Lua files
          end,
        },
      })
    end,
  },
  -- {
  --   'airblade/vim-rooter',
  --   init = function()
  --     vim.g.rooter_patterns = { '.git', 'pyproject.toml', 'package.json', '!node_modules' }
  --   end,
  --   vim.keymap.set('n', '<leader>a', function() end),
  -- },
  'kchmck/vim-coffee-script',
  'digitaltoad/vim-pug',

  -- colorscheme: tokyonight is set by top init.lua by priority 1000
  'navarasu/onedark.nvim',
  -- 'doums/darcula',
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },
  'vim-scripts/sudo.vim',
  -- {
  --   'folke/noice.nvim',
  --   event = 'VeryLazy',
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     'MunifTanjim/nui.nvim',
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     'rcarriga/nvim-notify',
  --   },
  --   config = function()
  --     require('noice').setup {
  --       lsp = {
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
  --           ['vim.lsp.util.stylize_markdown'] = true,
  --           ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
  --         },
  --       },
  --       -- views = {
  --       --   backend = 'notify',
  --       --   fallback = 'mini',
  --       --   format = 'notify',
  --       --   replace = false,
  --       --   merge = false,
  --       --   view = 'notify',
  --       --   position = {
  --       --     row = -1, -- 画面下端から1行上
  --       --     col = -1, -- 画面右端から1列左
  --       --   },
  --       --   size = {
  --       --     width = 'auto',
  --       --     height = 'auto',
  --       --   },
  --       --   win_options = {
  --       --     winblend = 0,
  --       --   },
  --       -- },
  --       views = {
  --         notify = {
  --           backend = 'notify',
  --           anchor = 'SE', -- South-East (右下)
  --           position = {
  --             row = '95%', -- 画面の95%の位置
  --             col = '95%', -- 画面の95%の位置
  --           },
  --           size = {
  --             width = 'auto',
  --             height = 'auto',
  --           },
  --         },
  --       },
  --       -- you can enable a preset for easier configuration
  --       presets = {
  --         bottom_search = true, -- use a classic bottom cmdline for search
  --         command_palette = true, -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = false, -- add a border to hover docs and signature help
  --       },
  --     }
  --   end,
  -- },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Add to Harpoon list' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle Harpoon Menu' })

      vim.keymap.set('n', '<leader>h1', function()
        harpoon:list():select(1)
      end, { desc = '1st Harpoon list' })
      vim.keymap.set('n', '<leader>h2', function()
        harpoon:list():select(2)
      end, { desc = '2nd Harpoon list' })
      vim.keymap.set('n', '<leader>h3', function()
        harpoon:list():select(3)
      end, { desc = '3rd Harpoon list' })
      vim.keymap.set('n', '<leader>h4', function()
        harpoon:list():select(4)
      end, { desc = '4th Harpoon list' })

      -- Toggle previous & next buffers stored within Harpoon list
      -- vim.keymap.set('n', '<leader>hn', function()
      --   harpoon:list():prev()
      -- end, { desc = 'Next Harpoon list' })
      -- vim.keymap.set('n', '<leader>hp', function()
      --   harpoon:list():next()
      -- end, { desc = 'Previous Harpoon list' })
    end,
  },
  -- {
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   opts = {},
  -- },
  -- {
  -- 'tyru/caw.vim',
  -- config = function ()
  --   -- caw for comment out <C-_> means <C-/>
  --   vim.keymap.set("n", "<C-_>",     "<plug>(caw:i:toggle)", { desc = '' })
  --   vim.keymap.set("v", "<C-_>",     "<plug>(caw:i:toggle)", { desc = '' })
  --   vim.keymap.set("n", "<Leader>/", "<plug>(caw:i:toggle)", { desc = '' })
  --   vim.keymap.set("v", "<Leader>/", "<plug>(caw:i:toggle)", { desc = '' })
  -- end,
  -- },
  --  'jayp0521/mason-null-ls.nvim',
  -- {
  --   'nvimtools/none-ls.nvim',
  --   ft = 'go',
  --   opts = function()
  --     local null_ls = require 'null-ls'
  --     local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
  --     local opts = {
  --       sources = {
  --         null_ls.builtins.formatting.gofmt,
  --         null_ls.builtins.formatting.goimports,
  --       },
  --       on_attach = function(client, bufnr)
  --         if client.supports_method 'textDocument/formatting' then
  --           vim.api.nvim_clear_autocmds {
  --             group = augroup,
  --             buffer = bufnr,
  --           }
  --           vim.api.nvim_create_autocmd('BufWritePre', {
  --             group = augroup,
  --             buffer = bufnr,
  --             callback = function()
  --               vim.lsp.buf.format { bufnf = bufnr }
  --             end,
  --           })
  --         end
  --       end,
  --     }
  --     return opts
  --   end,
  -- },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   ft = "go",
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  {
    'okuuva/auto-save.nvim',
    cmd = 'ASToggle', -- optional for lazy loading on command
    event = { 'InsertLeave', 'TextChanged' }, -- optional for lazy loading on trigger events
    opts = {
      condition = function(buf)
        if vim.bo[buf].filetype == 'harpoon' then
          return false
        end
        return true
      end,
      triger_events = {
        immediae_save = { 'BufLeave', 'FocusLost' },
        defer_save = { 'InsertLeave' },
        cancel_defered_save = { 'InsertEnter' },
      },
      debounce_delay = 1000,
      -- your config goes here
      -- or just leave it empty :)
    },
  },
  -- {
  --   'folke/snacks.nvim',
  --   priority = 1000,
  --   lazy = false,
  --   ---@type snacks.Config
  --   opts = {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --     -- bigfile = { enabled = true },
  --     -- dashboard = { enabled = true },
  --     explorer = { enabled = true },
  --     indent = { enabled = true },
  --     -- input = { enabled = true },
  --     picker = { enabled = true },
  --     -- notifier = { enabled = true },
  --     -- quickfile = { enabled = true },
  --     -- scope = { enabled = true },
  --     -- scroll = { enabled = true },
  --     -- statuscolumn = { enabled = true },
  --     -- words = { enabled = true },
  --   },
  --   keys = {
  --     -- Top Pickers & Explorer
  --     {
  --       '<leader><space>',
  --       function()
  --         Snacks.picker.smart()
  --       end,
  --       desc = 'Smart Find Files',
  --     },
  --     {
  --       '<leader>sf',
  --       function()
  --         Snacks.picker.smart()
  --       end,
  --       desc = 'Smart Find Files',
  --     },
  --     {
  --       '<leader>,',
  --       function()
  --         Snacks.picker.buffers()
  --       end,
  --       desc = 'Buffers',
  --     },
  --     {
  --       '<leader>/',
  --       function()
  --         Snacks.picker.grep()
  --       end,
  --       desc = 'Grep',
  --     },
  --     {
  --       '<leader>:',
  --       function()
  --         Snacks.picker.command_history()
  --       end,
  --       desc = 'Command History',
  --     },
  --     {
  --       '<leader>n',
  --       function()
  --         Snacks.picker.notifications()
  --       end,
  --       desc = 'Notification History',
  --     },
  --     {
  --       '<leader>n',
  --       function()
  --         Snacks.explorer()
  --       end,
  --       desc = 'File Explorer',
  --     },
  --     -- find
  --     {
  --       '<leader>fb',
  --       function()
  --         Snacks.picker.buffers()
  --       end,
  --       desc = 'Buffers',
  --     },
  --     {
  --       '<leader>fc',
  --       function()
  --         Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
  --       end,
  --       desc = 'Find Config File',
  --     },
  --     {
  --       '<leader>ff',
  --       function()
  --         Snacks.picker.files()
  --       end,
  --       desc = 'Find Files',
  --     },
  --     {
  --       '<leader>fg',
  --       function()
  --         Snacks.picker.git_files()
  --       end,
  --       desc = 'Find Git Files',
  --     },
  --     {
  --       '<leader>fp',
  --       function()
  --         Snacks.picker.projects()
  --       end,
  --       desc = 'Projects',
  --     },
  --     {
  --       '<leader>fr',
  --       function()
  --         Snacks.picker.recent()
  --       end,
  --       desc = 'Recent',
  --     },
  --     -- git
  --     {
  --       '<leader>gb',
  --       function()
  --         Snacks.picker.git_branches()
  --       end,
  --       desc = 'Git Branches',
  --     },
  --     {
  --       '<leader>gl',
  --       function()
  --         Snacks.picker.git_log()
  --       end,
  --       desc = 'Git Log',
  --     },
  --     {
  --       '<leader>gL',
  --       function()
  --         Snacks.picker.git_log_line()
  --       end,
  --       desc = 'Git Log Line',
  --     },
  --     {
  --       '<leader>gs',
  --       function()
  --         Snacks.picker.git_status()
  --       end,
  --       desc = 'Git Status',
  --     },
  --     {
  --       '<leader>gS',
  --       function()
  --         Snacks.picker.git_stash()
  --       end,
  --       desc = 'Git Stash',
  --     },
  --     {
  --       '<leader>gd',
  --       function()
  --         Snacks.picker.git_diff()
  --       end,
  --       desc = 'Git Diff (Hunks)',
  --     },
  --     {
  --       '<leader>gf',
  --       function()
  --         Snacks.picker.git_log_file()
  --       end,
  --       desc = 'Git Log File',
  --     },
  --     -- Grep
  --     {
  --       '<leader>sb',
  --       function()
  --         Snacks.picker.lines()
  --       end,
  --       desc = 'Buffer Lines',
  --     },
  --     {
  --       '<leader>sB',
  --       function()
  --         Snacks.picker.grep_buffers()
  --       end,
  --       desc = 'Grep Open Buffers',
  --     },
  --     {
  --       '<leader>sg',
  --       function()
  --         Snacks.picker.grep()
  --       end,
  --       desc = 'Grep',
  --     },
  --     {
  --       '<leader>sw',
  --       function()
  --         Snacks.picker.grep_word()
  --       end,
  --       desc = 'Visual selection or word',
  --       mode = { 'n', 'x' },
  --     },
  --     -- search
  --     {
  --       '<leader>s"',
  --       function()
  --         Snacks.picker.registers()
  --       end,
  --       desc = 'Registers',
  --     },
  --     {
  --       '<leader>s/',
  --       function()
  --         Snacks.picker.search_history()
  --       end,
  --       desc = 'Search History',
  --     },
  --     {
  --       '<leader>sa',
  --       function()
  --         Snacks.picker.autocmds()
  --       end,
  --       desc = 'Autocmds',
  --     },
  --     {
  --       '<leader>sb',
  --       function()
  --         Snacks.picker.lines()
  --       end,
  --       desc = 'Buffer Lines',
  --     },
  --     {
  --       '<leader>sc',
  --       function()
  --         Snacks.picker.command_history()
  --       end,
  --       desc = 'Command History',
  --     },
  --     {
  --       '<leader>sC',
  --       function()
  --         Snacks.picker.commands()
  --       end,
  --       desc = 'Commands',
  --     },
  --     {
  --       '<leader>sd',
  --       function()
  --         Snacks.picker.diagnostics()
  --       end,
  --       desc = 'Diagnostics',
  --     },
  --     {
  --       '<leader>sD',
  --       function()
  --         Snacks.picker.diagnostics_buffer()
  --       end,
  --       desc = 'Buffer Diagnostics',
  --     },
  --     {
  --       '<leader>sh',
  --       function()
  --         Snacks.picker.help()
  --       end,
  --       desc = 'Help Pages',
  --     },
  --     {
  --       '<leader>sH',
  --       function()
  --         Snacks.picker.highlights()
  --       end,
  --       desc = 'Highlights',
  --     },
  --     {
  --       '<leader>si',
  --       function()
  --         Snacks.picker.icons()
  --       end,
  --       desc = 'Icons',
  --     },
  --     {
  --       '<leader>sj',
  --       function()
  --         Snacks.picker.jumps()
  --       end,
  --       desc = 'Jumps',
  --     },
  --     {
  --       '<leader>sk',
  --       function()
  --         Snacks.picker.keymaps()
  --       end,
  --       desc = 'Keymaps',
  --     },
  --     {
  --       '<leader>sl',
  --       function()
  --         Snacks.picker.loclist()
  --       end,
  --       desc = 'Location List',
  --     },
  --     {
  --       '<leader>sm',
  --       function()
  --         Snacks.picker.marks()
  --       end,
  --       desc = 'Marks',
  --     },
  --     {
  --       '<leader>sM',
  --       function()
  --         Snacks.picker.man()
  --       end,
  --       desc = 'Man Pages',
  --     },
  --     {
  --       '<leader>sp',
  --       function()
  --         Snacks.picker.lazy()
  --       end,
  --       desc = 'Search for Plugin Spec',
  --     },
  --     {
  --       '<leader>sq',
  --       function()
  --         Snacks.picker.qflist()
  --       end,
  --       desc = 'Quickfix List',
  --     },
  --     {
  --       '<leader>sR',
  --       function()
  --         Snacks.picker.resume()
  --       end,
  --       desc = 'Resume',
  --     },
  --     {
  --       '<leader>su',
  --       function()
  --         Snacks.picker.undo()
  --       end,
  --       desc = 'Undo History',
  --     },
  --     {
  --       '<leader>uC',
  --       function()
  --         Snacks.picker.colorschemes()
  --       end,
  --       desc = 'Colorschemes',
  --     },
  --     -- LSP
  --     {
  --       'gd',
  --       function()
  --         Snacks.picker.lsp_definitions()
  --       end,
  --       desc = 'Goto Definition',
  --     },
  --     {
  --       'gD',
  --       function()
  --         Snacks.picker.lsp_declarations()
  --       end,
  --       desc = 'Goto Declaration',
  --     },
  --     {
  --       'gr',
  --       function()
  --         Snacks.picker.lsp_references()
  --       end,
  --       nowait = true,
  --       desc = 'References',
  --     },
  --     {
  --       'gI',
  --       function()
  --         Snacks.picker.lsp_implementations()
  --       end,
  --       desc = 'Goto Implementation',
  --     },
  --     {
  --       'gy',
  --       function()
  --         Snacks.picker.lsp_type_definitions()
  --       end,
  --       desc = 'Goto T[y]pe Definition',
  --     },
  --     {
  --       '<leader>ss',
  --       function()
  --         Snacks.picker.lsp_symbols()
  --       end,
  --       desc = 'LSP Symbols',
  --     },
  --     {
  --       '<leader>sS',
  --       function()
  --         Snacks.picker.lsp_workspace_symbols()
  --       end,
  --       desc = 'LSP Workspace Symbols',
  --     },
  --   },
  -- },
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  --   },
  --   config = function()
  --     require('nvim-tree').setup {
  --       filters = {
  --         dotfiles = false,
  --         git_ignored = false, -- デフォルトはtrue
  --         -- custom = {
  --         --   '^\\.git',
  --         --   '^node_modules',
  --         -- },
  --       },
  --       update_focused_file = {
  --         enable = true,
  --         update_cwd = true,
  --       },
  --     }
  --     vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { desc = '[N]vimTreeToggle' })
  --     -- vim.o.autochdir = true
  --   end,
  -- },
}
