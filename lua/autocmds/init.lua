--

local au = require("kaineer.autocmd").au

au("Whitespaces", function(cmd)
  cmd("BufWritePre", { command = "%s/\\s\\+$//e" })
end)
