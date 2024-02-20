return {
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            -- optional for floating window border decoration
            "nvim-lua/plenary.nvim",
        },
        config = function()
          vim.g.lazygit_floating_window_scaling_factor = 1 -- scaling factor for floating window
        end
    },
}
