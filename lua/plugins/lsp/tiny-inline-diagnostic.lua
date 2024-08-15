return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = {"CursorMoved", "CursorHold"},
    config = function()
        require("tiny-inline-diagnostic").setup()
        if vim.fn.has "nvim-0.10" == 1 then
            vim.diagnostic.config {
                virtual_text = false
            }
        end
    end,
    priority = 40, -- make sure it runs after nvim-lspconfig
    enabled = vim.fn.has "nvim-0.10" == 1
}
