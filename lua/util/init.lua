M = {}

function M.K(key, f, desc)
    return {
        key,  function() vim.cmd(f)  end, desc = desc
    }
end

return M