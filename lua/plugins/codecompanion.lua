if true then
	return {}
end
return {
	"olimorris/codecompanion.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
	opts = {
		adapters = {
			siliconflow = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://api.siliconflow.cn/v1",
						api_key = vim.env.SILICONFLOW_API_KEY,
						chat_url = "/chat/completions",
					},
					schema = {
						model = {
							default = "deepseek-ai/DeepSeek-V3",
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
			chat = { adapter = "sophnet" }, -- 使用 Gemini 作为聊天适配器
			inline = { adapter = "sophnet" }, -- 使用 Gemini 作为内联补全适配器
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
		vim.cmd([[cab c CodeCompanion]])
		vim.cmd([[cab cc CodeCompanionCmd]])
		vim.cmd([[cab ca CodeCompanionAction]])
		-- stylua: ignore end
	end,
}
