require("conf.base")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true,
}

-- 切换窗口
map("n", "<C-h>", "<C-w><C-h>", opt)
map("n", "<C-j>", "<C-w><C-j>", opt)
map("n", "<C-k>", "<C-w><C-k>", opt)
map("n", "<C-l>", "<C-w><C-l>", opt)

map("n", "<C-M-h>", "<C-W>H", opt)
map("n", "<C-M-j>", "<C-W>J", opt)
map("n", "<C-M-k>", "<C-W>K", opt)
map("n", "<C-M-l>", "<C-W>L", opt)

-- insert下保存
map("i", "<C-s>", "<Esc>:w<CR>a", opt)

-- quickfix
map("n", "co", "<cmd>copen<CR>", opt)
map("n", "cc", "<cmd>ccl<CR>", opt)
map("n", "c[", "<cmd>cprev<CR>", opt )
map("n", "c]", "<cmd>cnext<CR>", opt)


-- 取消高亮
map('n', "\\n", ":noh<CR>", opt)


-- tab移动
map("n", "<Tab>", ":bn<CR>", opt);
map("n", "<S-Tab>", ":bp<CR>", opt);
map("n", "<leader><Tab>", ":Bw<CR>", opt);


map("n", "'", ":", opt);





-- 调整窗口大小
map('n',"<A-=>", ":vertical resize +3<CR>", opt);
map('n',"<A-->", ":vertical resize -3<CR>", opt);

