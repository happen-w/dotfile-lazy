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
      {
        "<leader>to",
        function()
          vim.cmd("ToggleTerm")
        end,
        desc = "Open Terminal",
      },
    }
  }
}