if true then
	return {}
end
return {
	"ravitemer/mcphub.nvim",
	cmd = "MCPHub", -- lazy load by default
	build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
	opts = {
		port = 37373, -- Port for MCP Hub Express API
		config = vim.fn.expand("~/.config/mcphub/servers.json"), -- Config file path

		native_servers = {}, -- add your native servers here
		-- Extension configurations
		auto_approve = false,
		extensions = {
			avante = {
				make_slash_commands = true, -- make /slash commands from MCP server prompts
			},
			codecompanion = {
				show_result_in_chat = true, -- Show tool results in chat
				make_vars = true, -- Create chat variables from resources
				make_slash_commands = true, -- make /slash_commands from MCP server prompts
			},
		},

		-- UI configuration
		ui = {
			window = {
				width = 0.8, -- Window width (0-1 ratio)
				height = 0.8, -- Window height (0-1 ratio)
				border = "rounded", -- Window border style
				relative = "editor", -- Window positioning
				zindex = 50, -- Window stack order
			},
		},

		-- Event callbacks
		on_ready = function(hub) end, -- Called when hub is ready
		on_error = function(err) end, -- Called on errors

		-- Logging configuration
		log = {
			level = vim.log.levels.WARN, -- Minimum log level
			to_file = false, -- Enable file logging
			file_path = nil, -- Custom log file path
			prefix = "MCPHub", -- Log message prefix
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
		{
			"olimorris/codecompanion.nvim",
			optional = true,
			opts = {
				strategies = {
					chat = {
						tools = {
							["mcp"] = {
								-- calling it in a function would prevent mcphub from being loaded before it's needed
								callback = function()
									return require("mcphub.extensions.codecompanion")
								end,
								description = "Call tools and resources from the MCP Servers",
							},
						},
					},
				},
			},
		},
	},
}
