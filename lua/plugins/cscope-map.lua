return {

  {
    "dhananjaylatkar/cscope_maps.nvim",
    config = function()
      require("cscope_maps").setup()
    end,
    lazy = true,
    cmd = "Cscope"
  }
}
