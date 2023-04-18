-- lua/plugins/telekasten/config.lua

return function()
  local map = require('kaineer.map')

  local home = vim.fn.expand("~/git/notes/kasten")

  require('telekasten').setup {
    home = home,
    take_over_my_home = true,

    auto_set_filetype = true,

    dailies = home .. '/daily',
    weeklies = home .. '/weekly',
    templates = home .. '/templates',

    extension = '.md',
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    show_tags_theme = 'ivy',
    command_palette_theme = 'ivy',
    rename_update_links = true,
  }

  map.normal({
    { '<space>zw', ':Telekasten find_weekly_notes<cr>' },
    { '<space>zd', ':Telekasten find_daily_notes<cr>' },
    { '<space>zn', ':Telekasten find_notes<cr>' },
    { '<space>zs', ':Telekasten search_notes<cr>' },
    { '<space>z', ':Telekasten<cr>' },
  })
end

