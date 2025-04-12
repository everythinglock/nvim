return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		preset = "helix",
		spec = {
			{ "<leader>a", group = "Avante" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Code", mode = { "n", "x" } },
			{ "<leader>f", group = "Find" },
			{ "<leader>s", group = "Search" },
			{ "<leader>S", group = "Session" },
			{ "<leader>u", group = "Toggle" },
			{ "<leader>n", group = "Notifition/Notes" },
			{ "<leader>g", group = "Git", mode = { "n", "v" } },
		},
		win = {
			-- don't allow the popup to overlap with the cursor
			no_overlap = true,
			-- width = 1,
			-- height = { min = 4, max = 25 },
			-- col = 0,
			-- row = math.huge,
			-- border = "none",
			padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
			title = true,
			title_pos = "right",
			zindex = 1000,
			-- Additional vim.wo and vim.bo options
			bo = {},
			wo = {
				-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
