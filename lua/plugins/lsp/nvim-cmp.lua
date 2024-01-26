function select_jump(cmp, n)
    return cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item({ count = n })
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump(n)
        else
            fallback()
        end
    end, { 'i', 's' })
end

local M = {
    { 'hrsh7th/nvim-cmp',
      version = false, -- last release is way too old
      event = "InsertEnter",
      dependencies = {
          { 'hrsh7th/cmp-nvim-lsp' },
          { 'hrsh7th/cmp-buffer' },
          { 'hrsh7th/cmp-path' },
          { 'L3MON4D3/LuaSnip' },
          { 'saadparwaiz1/cmp_luasnip' },
          { 'rafamadriz/friendly-snippets' },
          { 'onsails/lspkind.nvim' },
      },
      config = function()
          local luasnip = require("luasnip");
          local cmp = require('cmp');
          local lspkind = require('lspkind')
          require("luasnip.loaders.from_vscode").lazy_load()
          cmp.setup({
              snippet = {
                  expand = function(args)
                      luasnip.lsp_expand(args.body)
                  end,
              },
              mapping = cmp.mapping.preset.insert({
                  ['<CR>'] = cmp.mapping.confirm {
                      behavior = cmp.ConfirmBehavior.Replace,
                      select = true,
                  },
                  ['<Tab>'] = select_jump(cmp, 1),
                  ['<S-Tab>'] = select_jump(cmp, -1),
                  ['`'] = select_jump(cmp, 4),
                  ['~'] = select_jump(cmp, -4)
              }),
              sources = {
                  { name = 'luasnip' },
                  { name = 'nvim_lsp' },
                  { name = 'buffer' },
                  { name = 'path' },
              },
              -- 使用lspkind-nvim显示类型图标
              formatting = {
                  format = lspkind.cmp_format({
                      with_text = true, -- do not show text alongside icons
                      maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                      before = function(entry, vim_item)
                          -- Source 显示提示来源
                          vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                          return vim_item
                      end
                  })
              },
          })
      end
    },
}

return M