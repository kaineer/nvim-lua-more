--

require("kaineer.autocmd").au("Whitespaces", function(cmd)
  cmd("BufWritePre", { command = "%s/\\s\\+$//e" })
end)("DirEnv", function(cmd)
  cmd("BufWritePost", {
    pattern = ".envrc",
    callback = function()
      vim.cmd(":!direnv allow " .. vim.fn.expand("%:p:h"))
    end,
  })
end)("CurrentColumn", function(cmd)
  cmd("FileType", {
    pattern = { "yaml", "python", "json" },
    callback = function()
      vim.wo.cuc = true
    end,
  })
end)("OpLs", function(cmd)
  local bindings = {
    { 'l', 'Vy:!<c-r>" >/dev/null<cr><cr>' },
  }
  local opts = { silent = true, noremap = false, }

  cmd("BufReadPre", {
    pattern = "op.ls.sh",
    callback = function()
      require("kaineer.map").buffer(bindings, opts)
    end,
  })
end)


-- local au = require("kaineer.autocmd").au
--
-- au("Whitespaces", function(cmd)
--   cmd("BufWritePre", { command = "%s/\\s\\+$//e" })
-- end)
--
-- au("DirEnv", function(cmd)
--   cmd("BufWritePost", {
--     pattern = ".envrc",
--     callback = function()
--       vim.cmd(":!direnv allow " .. vim.fn.expand("%:p:h"))
--     end,
--   })
-- end)
--
-- au("CurrentColumn", function(cmd)
--   cmd("FileType", {
--     pattern = { "yaml", "python", "json" },
--     callback = function()
--       vim.wo.cuc = true
--     end,
--   })
-- end)
--
-- au("OpLs", function(cmd)
--   local bindings = {
--     { 'l', 'Vy:!<c-r>" >/dev/null<cr><cr>' },
--   }
--   local opts = { silent = true, noremap = false, }
--
--   cmd("BufReadPre", {
--     pattern = "op.ls.sh",
--     callback = function()
--       require("kaineer.map").buffer(bindings, opts)
--     end,
--   })
-- end)
--
