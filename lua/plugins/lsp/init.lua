--vim.lsp.buf.hover()：代码的TIPS悬浮展示。
--vim.lsp.buf.format()：代码格式化。
--vim.lsp.buf.references()：当前代码符号的引用查询。
--vim.lsp.buf.implementation()：当前代码（主要是函数方法）的实现定位。
--vim.lsp.buf.code_action()：当前代码的一些优化操作。

-- lua 需要安装lua-language-server
--scoop install lua-language-server
--scoop install main/clangd

Set_key_map = function(args)
  vim.api.nvim_buf_set_keymap(args.buf, "n", "==", "<cmd>lua vim.lsp.buf.format()<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(args.buf, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(args.buf, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(args.buf, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(args.buf, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(args.buf, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>1", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true })
end


return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspConfig = require('lspconfig')
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = Set_key_map
      })
      lspConfig['lua_ls'].setup(require("plugins.lsp.lua_ls"))
      lspConfig['clangd'].setup({})
      require'lspconfig'.pyright.setup({})
    end
  },

  require("plugins.lsp.nvim-treesitter"),
  require("plugins.lsp.nvim-cmp"),

}
