local Util = require("util")

Last_quit = function()
  if #vim.api.nvim_list_wins() == 1 and vim.b.NERDTree and vim.b.NERDTree.isTabTree then
    vim.cmd([[quit]])
  end
end

return {
  {
    "preservim/nerdtree",
    dependencies = {
      {
        "t9md/vim-choosewin", -- 窗口选择
        keys = {
          Util.K("-", "ChooseWin", "open Choose Win")
        },
      },
      { 'happen-w/nerdtree_choosewin-plugin' }, -- 打开的时候可以选择窗口
      { "ryanoasis/vim-devicons" }              -- 文件显示图标
    },
    config = function()
      vim.g.NERDTreeShowBookmarks = 1
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeHijackNetrw = 1

      -- 当最后一个窗口关闭neovim
      vim.cmd([[autocmd BufEnter * :lua Last_quit()]])

      -- 启动gdb调试的时候自动关闭 NerdTree
      vim.cmd([[autocmd User NvimGdbStart :NERDTreeClose]])
    end,
    keys = {
      Util.K("<leader>n", "NERDTree", "Explorer NerdTree (root dir)")
    }
  },

  --]b和[b循环遍历缓冲区。
  --]f和[f循环遍历同一目录中的文件，并打开为当前缓冲区。
  --]l和[l遍历位置列表
  --]q和[q遍历快速修复列表
  --]t和[t遍历标签列表
  { "tpope/vim-unimpaired" },
  -- buffer 变成 tap 使用 tab 切换buffer
  { "bagrat/vim-buffet" },

  -- surround
  { "tpope/vim-surround" },

  -- 括号自动补全
  {
    "jiangmiao/auto-pairs",
    init = function()
      vim.g.AutoPairsFlyMod = 1
      vim.g.AutoPairsShortcutBackInsert = '<M-b>'
    end
  },
}
