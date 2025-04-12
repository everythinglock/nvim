return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- 永远不要将此值设置为 "*"！永远不要！
	opts = {
		provider = "sophnet", -- You can then change this provider here
		vendors = {
			["sophnet"] = {
				__inherited_from = "openai",
				endpoint = "https://www.sophnet.com/api/open-apis/v1",
				model = "DeepSeek-v3",
				api_key_name = "SOPHNET_API_KEY",

				timeout = 30000, -- 超时时间（毫秒），增加此值以适应推理模型
				temperature = 0,
				max_tokens = 8192, -- 增加此值以包括推理模型的推理令牌
				--reasoning_effort = "medium", -- low|medium|high，仅用于推理模型
			},
		},
		selector = {
			provider = "snacks",
			-- 自定义提供者的选项覆盖
			provider_opts = {},
		},
		hints = {
			enabled = false,
		},
	},
	-- 如果您想从源代码构建，请执行 `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- 对于 Windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
}
