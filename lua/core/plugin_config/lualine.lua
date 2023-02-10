require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {
      {
        'mode',
      },
      {
        'filename',
        file_status = true,
        path = 3,
        shorting_target = 40,
        symbols = {
          modified = '[+]',
          readonly = '[-]',
          unnamed = '[No Name]',
          newfile = '[New]',
        },
      },
    },
    lualine_b = {
      {
        'branch',
      },
    },
    lualine_c = {
      {
        "diff",
        colored = true,
        diff_color = {
          added = 'DiffAdd',
          modified = 'DiffChange',
          removed = 'DiffDelete',
        },
        symbols = {
          added = '+',
          modified = '~',
          removed = '-'
        },
        source = nil
      },
    },
    lualine_x = {
      'encoding', 'fileformat', 'filetype'
    },
    lualine_y = {
      'progress',
    },
    lualine_z = {
      'location'
    },
  },

  tabline = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true,
        mode = 2,
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        "os.date('%a %b %d %l:%M %p')",
        'data',
        "require'lsp-status'.status()"
      }

    }
  }
}

vim.keymap.set('n', '<Space>b', ':LualineBuffersJump! ')
