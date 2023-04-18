-- lua/plugins/comments/init.lua
--
-- https://github.com/numToStr/Comment.nvim

return {
  "numToStr/Comment.nvim",
  --
  -- https://github.com/numToStr/Comment.nvim#configuration-optional
  --
  config = function()
    require("Comment").setup {
      padding = true,
      sticky = true,
    }
  end,
}
