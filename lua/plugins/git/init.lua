--
-- plugins/git/init.lua
--

local gitPlugins = {
  -- magit
  'tpope/vim-fugitive',
  -- github
  'tpope/vim-rhubarb',
  -- gitlab
  'shumphrey/fugitive-gitlab.vim',
  -- versions history
  'junegunn/gv.vim',
  -- marks at gutter
  'airblade/vim-gitgutter',
}

return function(use)
  use(gitPlugins)
  use {
    'rhysd/git-messenger.vim',
    setup = function()
      vim.g.git_messenger_always_into_popup = true
      vim.g.git_messenger_date_format = "%Y.%m.%d -- %H:%M:%S"
      vim.g.git_messenger_floating_win_opts = {
        border = 'single'
      }
      vim.g.fugitive_gitlab_domains = {
        'https://gitlab.com',
        'ssh://gitlab.com',
        'https://gitlab.htmlacademy.dev',
        'ssh://gitlab.htmlacademy.dev',
      }

      require('kaineer.map').visual({
        { '<c-o>', ':GBrowse<cr>' },
      })
    end,
  }
end

