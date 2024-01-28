Set_key_map = function(args)
  vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>rd", "<cmd>ReplClose<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(args.buf, "n", "<C-l>", "<cmd>ReplClear<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(args.buf, "v", "<C-p>", "<Plug>ReplSendVisual", { noremap = true })
  vim.api.nvim_buf_set_keymap(args.buf, "n", "<C-p>", "<Plug>ReplSendLine", { noremap = true })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "StartRepl",
  callback = Set_key_map
})


return {
  {
    "pappasam/nvim-repl",
    cmd = "Repl",
    config = function ()
      vim.cmd([[doautocmd User StartRepl]])
    end,
    init = function()
      vim.g["repl_filetype_commands"] = {
        javascript = "node",
        python = "ipython --no-autoindent",
        lua = "lua",
      }
      vim.g.repl_split = 'right'
    end,
  }
}

