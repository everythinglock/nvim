-- if true then
-- 	return {}
-- end
return {
	"olimorris/codecompanion.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
	opts = {
		opts = {
			language = "Chinese",
		},
		adapters = {
			chataiapi = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://api.chataiapi.com/v1",
						api_key = vim.env.CHATAIAPI_API_KEY,
						chat_url = "/chat/completions",
					},
					schema = {
						model = {
							default = "deepseek-v3",
						},
					},
				})
			end,
			sophnet = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://www.sophnet.com/api/open-apis/v1",
						api_key = vim.env.SOPHNET_API_KEY,
						chat_url = "/chat/completions",
					},
					schema = {
						model = {
							default = "DeepSeek-v3",
						},
					},
				})
			end,
		},
		strategies = {
			chat = { adapter = "chataiapi" },
			inline = { adapter = "chataiapi" },
		},
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)
		-- stylua: ignore start
		vim.keymap.set("n", "<leader>ac", "<CMD>CodeCompanionChat Toggle<CR>", { desc = "Toggle", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>aa", "<CMD>CodeCompanionActions<CR>", { desc = "action", noremap = true, silent = true })
		vim.keymap.set("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
		vim.keymap.set("v", "<C-c>", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])
		vim.cmd([[cab ccc CodeCompanionCmd]])
		vim.cmd([[cab cca CodeCompanionAction]])
		-- stylua: ignore end
	end,
}
