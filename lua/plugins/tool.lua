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
	{
		"max397574/better-escape.nvim",
		opts = {
			timeout = vim.o.timeoutlen, -- after `timeout` passes, you can press the escape key and the plugin will ignore it
			default_mappings = true, -- setting this to false removes all the default mappings
			mappings = {
				-- i for insert
				i = {
					j = {
						-- These can all also be functions
						k = "<Esc>",
						j = "<Esc>",
					},
				},
				c = {
					j = {
						k = "<C-c>",
						j = "<C-c>",
					},
				},
				t = {
					j = {
						k = "<C-\\><C-n>",
					},
				},
				v = {
					j = {
						k = "<Esc>",
					},
				},
				s = {
					j = {
						k = "<Esc>",
					},
				},
			},
		},
	},
}
