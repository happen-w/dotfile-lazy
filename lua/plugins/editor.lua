return {
    {
        "preservim/nerdtree",
        dependencies = {
            {
                "t9md/vim-choosewin",
                keys = {
                    {
                        "-",
                        function()
                            vim.cmd("ChooseWin")
                        end,
                        desc = "open Choose Win"
                    }
                },
            },
            'happen-w/nerdtree_choosewin-plugin',
        },
        init = function()
            vim.g.NERDTreeShowBookmarks = 1
            vim.g.NERDTreeShowHidden = 1
            vim.g.NERDTreeHijackNetrw = 1
            local autocmd = vim.api.nvim_create_autocmd

            -- 当最后一个窗口关闭neovim
            autocmd("BufEnter", {
                callback = function()
                    if #vim.api.nvim_list_wins() == 1 and vim.b.NERDTree and vim.b.NERDTree.isTabTree then
                        vim.cmd "quit"
                    end
                end
                 }
            )
        end,
        keys = {
            {
                "<leader>n",
                function()
                    vim.cmd("NERDTree")
                end,
                desc = "Explorer NerdTree (root dir)",
            },
        }
    },


}