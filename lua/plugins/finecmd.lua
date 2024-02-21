return {
  'VonHeikemen/fine-cmdline.nvim',
  requires = {
    {'MunifTanjim/nui.nvim'},
  },
  opts = {
    cmdline = {
      enable_keymaps = true,
      smart_history = true,
      prompt = ': '
    },
    popup = {
      position = {
        row = '10%',
        col = '50%',
      },
      size = {
        width = '60%',
      },
      border = {
        style = 'rounded',
      },
      win_options = {
        winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
      },
    },
  },
  config = function()
    require('fine-cmdline').setup({
      hooks = {
        before_mount = function(input)
          -- code
        end,
        after_mount = function(input)
          vim.keymap.set('i', '<Esc>', '<cmd>stopinsert<cr>', {buffer = input.bufnr})
        end,
        set_keymaps = function(imap, feedkeys)
          -- code
        end,
      }
    })
  end,
}
