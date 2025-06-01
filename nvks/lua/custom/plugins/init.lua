-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'airblade/vim-rooter',
    init = function()
      vim.g.rooter_patterns = { '.git', 'pyproject.toml', 'package.json', '!node_modules' }
    end,
  },
  'kchmck/vim-coffee-script',
  'digitaltoad/vim-pug',

  -- colorscheme: tokyonight is set by top init.lua by priority 1000
  'navarasu/onedark.nvim',
  'doums/darcula',
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },
  'vim-scripts/sudo.vim',
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
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
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    },
    config = function()
      require('nvim-tree').setup {
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
      }
      vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { desc = '[N]vimTreeToggle' })
      -- vim.o.autochdir = true
    end,
  },
}
