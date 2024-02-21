return {
  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'neovim/nvim-lspconfig',
    },
    config = function()
      -- Set completeopt to have a better completion experience
      -- :help completeopt
      -- menuone: popup even when there's only one match
      -- noinsert: Do not insert text until a selection is made
      -- noselect: Do not select, force to select one from the menu
      -- shortness: avoid showing extra messages when using completion
      -- updatetime: set updatetime for CursorHold
      vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
      vim.opt.shortmess = vim.opt.shortmess + { c = true }
      vim.api.nvim_set_option('updatetime', 300)

      -- Fixed column for diagnostics to appear
      -- Show autodiagnostic popup on cursor hover_range
      -- Goto previous / next diagnostics warning / error
      -- Show inlay_hints more frequently
      vim.cmd([[
      set signcolumn=yes
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
      ]])

      -- Completion Plugin Setup
      local cmp = require'cmp'
      cmp.setup({
        -- Enable LSP snippets
        snippet = {
          expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Add tab support
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        },
        -- Installed sources:
        sources = {
          -- file paths
          { name = 'path' },
          -- from language server
          { name = 'nvim_lsp', keyword_length = 3 },
          -- display function signatures with current parameter emphasized
          { name = 'nvim_lsp_signature_help'},
          -- complete neovim's Lua runtime API such vim.lsp.*
          -- { name = 'nvim_lua', keyword_length = 2},
          -- source current buffer
          { name = 'buffer', keyword_length = 2 },
          -- nvim-cmp source for vim-vsnip
          { name = 'vsnip', keyword_length = 2 },
          -- source for math calculation
          { name = 'calc'},
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
            fields = {'menu', 'abbr', 'kind'},
            format = function(entry, item)
                local menu_icon ={
                    nvim_lsp = 'λ',
                    vsnip = '⋗',
                    buffer = 'Ω',
                    path = '🖫',
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        },
      })

      -- for c family language
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require'lspconfig'.clangd.setup {
        capabilities = capabilities,
      }

      -- Auto formatting on save
      vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

      -- -- LSP Diagnostics Options Setup
      -- local sign = function(opts)
      --   vim.fn.sign_define(opts.name, {
      --     texthl = opts.name,
      --     text = opts.text,
      --     numhl = ''
      --   })
      -- end

      -- sign({name = 'DiagnosticSignError', text = ''})
      -- sign({name = 'DiagnosticSignWarn', text = ''})
      -- sign({name = 'DiagnosticSignHint', text = ''})
      -- sign({name = 'DiagnosticSignInfo', text = ''})

      -- vim.diagnostic.config({
      --     virtual_text = false,
      --     signs = true,
      --     update_in_insert = true,
      --     underline = true,
      --     severity_sort = false,
      --     float = {
      --         border = 'rounded',
      --         source = 'always',
      --         header = '',
      --         prefix = '',
      --     },
      -- })

      -- vim.cmd([[
      -- set signcolumn=yes
      -- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
      -- ]])
    end,
  },


}