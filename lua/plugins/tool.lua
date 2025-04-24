return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		-- stylua: ignore
		keys = {
			{ "<leader>Sr", function() require("persistence").load() end, desc = "[R]estro [S]ession " },
			{ "<leader>Ss", function() require("persistence").select() end,desc = "[S]ession [S]elect " },
			{ "<leader>Sl", function() require("persistence").load({ last = true }) end, desc = "Restore [L]ast [S]ession" },
			{ "<leader>Sd", function() require("persistence").stop() end, desc = "[D]on't Save Current [S]ession" },
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			jump = { enable = false },
		},
		-- stylua: ignore
		keys = {
			{ "<CR>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		},
	},
}
