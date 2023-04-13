return function()
    require('legendary').setup({
        include_builtin = true,
        auto_register_which_key = true,
        extensions = {
            -- to use default settings:
            smart_splits = {}
        }
    })
end