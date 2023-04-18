-- lua/plugins/status/init.lua

return {
  "nvim-lualine/lualine.nvim",
  requires = {
    "kyazdani42/nvim-web-devicons",
    opt = true,
  },
  config = require("plugins.status.lualine"),
}
