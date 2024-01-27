StartGdbSession = function()
  require("nvimgdb") -- 加载插件
  local exec_file = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  vim.cmd("wincmd l")
  vim.cmd("GdbStart gdb -q " .. exec_file)
end
vim.cmd([[command! StartGdbSession lua StartGdbSession() ]])

GdbSessionInit = function()
  -- create bt & info locals window
  -- vim.cmd(":belowright GdbCreateWatch thread apply all bt")
  -- vim.cmd(":wincmd h")
  -- vim.cmd(":belowright GdbCreateWatch info locals")
  -- vim.cmd(":set wrap")

  -- move cursor back to gdb terminal
  vim.cmd("wincmd l")
  -- vim.cmd(":wincmd k")
end

return {
  {
    "sakhnik/nvim-gdb",
    lazy = true,
    init = function()
      vim.g.nvimgdb_disable_start_keymaps = 1
      vim.g.nvimgdb_use_find_executables = 0
      vim.g.nvimgdb_use_cmake_to_find_executables = 0
      vim.g.nvimgdb_termwin_command = "rightbelow vnew"
      vim.g.nvimgdb_codewin_command = "vnew"
      vim.cmd([[autocmd User NvimGdbStart :lua GdbSessionInit()]])
    end
  },
}
