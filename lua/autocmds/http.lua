return {
  name = "Http",
  config = function(cmd)
    local bindings = {
      { '<c-l>', ':lua require("kulala").run()<CR>' },
    }

    local opts = { silent = true, noremap = false, }
    cmd("BufReadPre", {
      pattern = "*.http",
      callback = function()
        require("kaineer.map").buffer(bindings, opts)
      end,
    })
  end,
}
