-- lua/plugins/colorscheme/nord.lua

return {
  'arcticicestudio/nord-vim',
  config = function()
    local kf = require("kaineer.fn")

    vim.cmd('colorscheme nord')

    kf.assign(vim.g, {
      nord_disable_background = true,
      nord_contrast = false,
      nord_borders = true
    })

    vim.cmd(':hi Delimiter ctermfg=15')

    require("plugins.colorscheme.focus").setup({
      colors = {
        active = " guibg=#2e3440",
	      inactive = " guibg=#4b556a",
      },
      backgrounds = {
	      "Normal", "LineNr", "SignColumn",
      }
    })
  end,
}
