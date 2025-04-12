return {
	{
		"echasnovski/mini.nvim",
		config = function()
			-- tool
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			require("mini.pairs").setup()
			require("mini.comment").setup()
			require("mini.pick").setup()

			-- format
			require("mini.align").setup()
			require("mini.splitjoin").setup()

			-- git
			require("mini.diff").setup()

			-- ui
			require("mini.tabline").setup()
			require("mini.statusline").setup()
			require("mini.icons").setup()
		end,
	},
}
