-- lua/plugins/telescope/init.lua

local configTelescope = function()
  local forEach = require('kaineer.fn').forEach
  local telescope = require('telescope')
  local map = require('kaineer.map')

  local cmd = function(value)
    return ":" .. value .. "<cr>"
  end

  local telescope_cmd = function(name)
    return cmd("Telescope " .. name)
  end

  local extensionsToLoad = {
    'project', 'ui-select', 'file_browser',
  }

  local load_extension = function(name)
    telescope.load_extension(name)
  end

  forEach(extensionsToLoad, load_extension)

  telescope.setup {
    defaults = require('telescope.themes').get_ivy(),
    extensions = {
      project = {
        base_dirs = {
          { path = '/home/kaineer/git', max_depth = 3 },
          { path = '/home/kaineer/devel/htmlacademy', max_depth = 2 },
        },
        theme = 'ivy',
      },
      ["ui-select"] = {
        require('telescope.themes').get_cursor {}
      },
      file_browser = {
        theme = "ivy",
        hijack_netrw = false,
      },
    },
  }

  map.normal({
    { '<space>of', telescope_cmd('find_files') },
    { '<space>ot', telescope_cmd('file_browser') },
    { '<space>oh', telescope_cmd('oldfiles') },
    { '<space>og', telescope_cmd('git_files') },
    { '<space>om', telescope_cmd('keymaps') },
    { '<space>or', telescope_cmd('registers') },
    { '<space>ol', telescope_cmd('current_buffer_fuzzy_find') },
    { '<space>/',  telescope_cmd('current_buffer_fuzzy_find') },
    { '<space>od', telescope_cmd('diagnostics') },
    { '<space>rg', telescope_cmd('live_grep') },
    { '<space>op', telescope_cmd('project') },

    { '<space>ouu', ":UrlView<cr>" },
    { '<space>oup', ":UrlView packer<cr>" },
    -- { '<space>gi', cmd('gh issues') },
    -- { '<space>gr', cmd('gh run') },
    -- { '<space>gg', cmd('gh gist') },
    -- { '<space>gp', cmd('gh pull_requests') },

    -- notifications
    -- { '<space>on', cmd('notify') },
  })
end

local telescopeRequires = {
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope-github.nvim',
  'nvim-telescope/telescope-project.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
}

local telescopeData = {
  'nvim-telescope/telescope.nvim',
  requires = telescopeRequires,
  config = configTelescope,
}

return function(use)
  use(telescopeRequires)
  use(telescopeData)
end
