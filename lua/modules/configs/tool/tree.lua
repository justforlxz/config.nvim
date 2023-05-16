-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- Description:
-- file explorer

return function()
        require("neo-tree").setup({
                window = {
                        width = 30,
                        mappings = {
                                ["l"] = 'open',
                                ["h"] = 'close_node',
                        },
                },
                filesystem = {
                        follow_current_file = true,
                        filtered_items = {
                                visible = true,
                                never_show = {
                                        ".git",
                                },
                        },
                        window = {
                                mappings = {
                                        ["L"] = "set_root",
                                        ["H"] = "navigate_up",
                                },
                        },
                },
        })
        vim.cmd([[
                nnoremap <silent> <leader>e :Neotree toggle reveal_force_cwd<CR>
        ]])
end
