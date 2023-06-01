--

local au = require("kaineer.autocmd").au

au("Whitespaces", function(cmd)
  cmd("BufWritePre", { command = "%s/\\s\\+$//e" })
end)

au("DirEnv", function(cmd)
  cmd("BufWritePost", {
    pattern = ".envrc",
    callback = function()
      vim.cmd(":!direnv allow " .. vim.fn.expand("%:p:h"))
    end,
  })
end)

au("CurrentColumn", function(cmd)
  cmd("FileType", {
    pattern = { "yaml", "python", "json" },
    callback = function()
      vim.wo.cuc = true
    end,
  })
end)
