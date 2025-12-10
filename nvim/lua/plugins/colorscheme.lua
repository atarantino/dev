return {
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				-- Optional configuration here
			})
			require("bamboo").load()
		end,
	},

	-- Configure LazyVim to use bamboo
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "bamboo",
		},
	},
}