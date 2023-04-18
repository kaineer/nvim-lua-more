-- lua/plugins/navigation/projectionist.lua

-- DONE: add commands to switch between alternatives

return {
  "tpope/vim-projectionist",
  config = function()
    local mkcmd = function(name)
      return function()
        if not pcall(function() vim.api.nvim_command(":" .. name) end) then
          print("Could not use projectionist alternate")
        end
      end
    end

    require("which-key").register({
      a = {
        a = { mkcmd("A"), "Projectionist alternate" },
        s = { mkcmd("AS"), "Projectionist alternate split" },
        v = { mkcmd("AV"), "Projectionist alternate vsplit" },
      }
    })
  end,
}
