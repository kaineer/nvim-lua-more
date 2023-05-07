return {
  buildMkcmd = function(message)
    return function(name) -- mkcmd()
      return function()
        if not pcall(function() vim.api.nvim_command(":" .. name) end) then
          print(message)
        end
      end
    end
  end,
}
