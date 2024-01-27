return {

  {
    "vim-airline/vim-airline",
    dependencies = {
      { "vim-airline/vim-airline-themes" }
    },
    lazy = false,
    init = function()
      vim.g.airline_theme = "badwolf"
    end
  }

}

