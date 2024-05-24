return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      local lualine = require 'lualine'

      -- Color table for highlights
      local colors = {
          bg = "transparent", -- base
          fg = "#cdd6f4", -- text
          yellow = "#f9e2af", -- yellow
          cyan = "#89dceb", -- cyan
          darkblue = "#585b70", -- surface1
          green = "#a6e3a1", -- green
          orange = "#fab387", -- orange
          violet = "#b4befe", -- lavender
          magenta = "#cba6f7", -- pink
          blue = "#89b4fa", -- blue
          red = "#f38ba8", -- red
          pink = "#f5c2e7", -- pink
          babypink = "#f4b8e4", -- baby pink
          lushpink = "#e78ac3", -- lush pink
      }

      local conditions = {
        buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
        hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
        check_git_workspace = function()
          local filepath = vim.fn.expand('%:p:h')
          local gitdir = vim.fn.finddir('.git', filepath .. ';')
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end
      }

      -- Config
      local config = {
        options = {
          -- Disable sections and component separators
          component_separators = "",
          section_separators = "",
          theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = {c = {fg = colors.fg, bg = colors.bg}},
            inactive = {c = {fg = colors.fg, bg = colors.bg}}
          }
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {}
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_v = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {}
        }
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x ot right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      -- ins_left {
      --   function() return '▊' end,
      --   color = {fg = colors.blue}, -- Sets highlighting of component
      --   left_padding = 0 -- We don't need space before this
      -- }

      ins_left {
        -- mode component
        function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = colors.pink,
            i = colors.green,
            v = colors.orange,
            [''] = colors.blue,
            V = colors.orange,
            c = colors.magenta,
            no = colors.red,
            s = colors.blue,
            S = colors.blue,
            [''] = colors.blue,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red
          }
          vim.api.nvim_command(
              'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" ..
                  colors.bg)
          return '🌸 '
        end,
        color = "LualineMode",
        left_padding = 0
      }

      ins_left {'location'}

      ins_left {
        'filename',
        condition = conditions.buffer_not_empty,
        color = {fg = colors.pink, gui = 'bold'}
      }


      ins_left {'progress', color = {fg = colors.fg, gui = 'bold'}}

      ins_left {
        'diagnostics',
        sources = {'nvim_lsp'},
        symbols = {error = ' ', warn = ' ', info = ' '},
        color_error = colors.red,
        color_warn = colors.yellow,
        color_info = colors.cyan
      }

      -- Insert mid section. You can make any number of sections in neovim :)
      -- for lualine it's any number greater then 2
      -- ins_left {function() return '%=' end}

      ins_right {
        'diff',
        -- Is it me or the symbol for modified us really weird
        symbols = {added = ' ', modified = ' ', removed = ' '},
        color_added = colors.green,
        color_modified = colors.orange,
        color_removed = colors.red,
        condition = conditions.hide_in_width
      }

      -- Add components to right sections
      ins_right {
        'branch',
        icon = '',
        condition = conditions.check_git_workspace,
        color = {fg = colors.violet, gui = 'bold'}
      }

      ins_right {
        'o:encoding', -- option component same as &encoding in viml
        upper = true, -- I'm not sure why it's upper case either ;)
        condition = conditions.hide_in_width,
        color = {fg = colors.green, gui = 'bold'}
      }

      -- ins_right {
      --   'fileformat',
      --   upper = true,
      --   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      --   color = {fg = colors.green, gui = 'bold'}
      -- }

      ins_right {
        -- Lsp server name .
        function()
          -- local msg = '🚧 No Active Lsp'
          local msg = ' '
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then return msg end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        color = {fg = colors.lushpink, gui = 'bold'}
      }

      lualine.setup(config)
    end
}



