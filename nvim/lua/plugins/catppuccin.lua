return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integration = {
				mason = true,
				neotree = true,
				telescope = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-frappe")
	end,
}
