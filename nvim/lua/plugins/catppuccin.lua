return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      default_integration = true,
    })
    vim.cmd.colorscheme "catppuccin-frappe"
  end
}

