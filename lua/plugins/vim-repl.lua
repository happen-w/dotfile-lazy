Set_key_map_repl = function(buf)
  vim.api.nvim_buf_set_keymap(buf, "n", "<leader>q", "<cmd>ReplClose<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "<C-l>", "<cmd>ReplClear<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(buf, "v", "<C-p>", "<Plug>ReplSendVisual", { noremap = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "<C-p>", "<Plug>ReplSendLine", { noremap = true })
end

return {
  {
    "pappasam/nvim-repl",
    cmd = "Repl",
    config = function()
      Set_key_map_repl(vim.api.nvim_get_current_buf())
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
