-- lua/bindings/init.lua

local map = require('kaineer.map')

local mkcmd = function(name, message, title)
  return function()
    vim.api.nvim_command(':' .. name)
  end
end

local window = {
  splith = mkcmd('sp'),
  splitv = mkcmd('vs'),
  quit = mkcmd('qa!'),
  close = function() pcall(function() vim.api.nvim_win_close(0, true); end); end,
  only = mkcmd('only'),
}

local diagnostics = {
  prev = function() vim.diagnostic.goto_next(); end,
  next = function() vim.diagnostic.goto_prev(); end,
}

local troubles = {
  toggle = mkcmd('TroubleToggle'),
  refresh = mkcmd('TroubleRefresh', 'List is refreshed', 'Troubles'),
}

local tabs = {
  new   = mkcmd('tabnew', 'created', 'Tabs'),
  close = mkcmd('tabclose'),
  next  = mkcmd('tabnext', 'next', 'Tabs'),
  prev  = mkcmd('tabprevious', 'previous', 'Tabs'),
}

local projectionist = {
  alt = mkcmd('A'),
  altv = mkcmd('AV'),
  alts = mkcmd('AS'),
}

local tmux = {
  rename = mkcmd('!n')
}

local debug = {
  syntaxName = function()
  end
}

map.normal({
  -- emacs way window bindings
  { '<c-x>0', window.close },
  { '<c-x>1', window.only },
  { '<c-x>2', window.splith },
  { '<c-x>3', window.splitv },
  { '<c-x><c-s>', mkcmd('w') },
  { '<c-x><c-c>', mkcmd('qa!') },
  --
  { '<m-i>', ':sp<cr><m-k>gg' },
  --
  { '<space>ws', window.splith },
  { '<space>w2', window.splith },
  { '<space>wv', window.splitv },
  { '<space>w3', window.splitv },
  { '<space>wc', window.close },
  { '<space>w0', window.close },
  { '<space>w1', window.only },
  { '<space>wq', window.quit },
  { '<space>k',  diagnostics.next },
  { '<space>j',  diagnostics.prev },
  { '<space>xx', troubles.toggle },
  { '<space>xr', troubles.refresh },
  { '<space>tc', tabs.new },
  { '<space>tx', tabs.close },
  { '<space>tl', tabs.next },
  { '<space>th', tabs.prev },
  -- { '<space>aa', projectionist.alt },
  -- { '<space>av', projectionist.altv },
  -- { '<space>as', projectionist.alts },
  { '<space>n',  tmux.rename },
  { '<space>gm', mkcmd('GitMessenger') },
  { '<space>gs', mkcmd('G') },
  { '<space>gl', mkcmd('GV') },

  { 'zz', 'V$%zf' },
})

map.visual({
  { ';',
    'y<c-[>:!browse "https://translate.google.com/?sl=ja&tl=ru&text=<c-r>""<cr>' }
})

map.normal({
  { '<space>tj',
    ':!browse "https://translate.google.com/?sl=ja&tl=ru&text=<c-r>""<cr>' }
})
