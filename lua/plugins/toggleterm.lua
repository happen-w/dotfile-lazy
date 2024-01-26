local Util = require("util")

return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        direction = 'float',
        close_on_exit = true,
        --shell = "zsh"
      })
    end,
    keys = {
      Util.K("<leader>to", "ToggleTerm", "Open Terminal")
    }
  }
}