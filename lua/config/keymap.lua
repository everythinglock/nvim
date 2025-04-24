local keymaps = {
	-- Move Lines
	{ "n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", "Move Down" },
	{ "n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", "Move Up" },
	{ "v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", "Move Down" },
	{ "v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "Move Up" },

	-- Add undo break-points
	{ "i", ",", ",<c-g>u" },
	{ "i", ".", ".<c-g>u" },
	{ "i", ";", ";<c-g>u" },
	{ "i", "。", "。<c-g>u" },
	{ "i", "，", "，<c-g>u" },
	{ "i", "；", "；<c-g>u" },

	-- Window navigation
	{ "n", "<C-h>", "<C-w><C-h>", "Move focus to the left window" },
	{ "n", "<C-l>", "<C-w><C-l>", "Move focus to the right window" },
	{ "n", "<C-j>", "<C-w><C-j>", "Move focus to the lower window" },
	{ "n", "<C-k>", "<C-w><C-k>", "Move focus to the upper window" },

	-- Window resizing
	{ "n", "<A-->", "<C-w><", "Decrease window width" },
	{ "n", "<A-=>", "<C-w>>", "Increase window width" },

	-- Save file
	{ { "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr>", "Save File" },

	-- Quit
	{ "n", "<leader>q", "<cmd>q<cr>", "Quit" },
	{ "n", "<leader>Q", "<cmd>wqa<cr>", "Quit" },

	-- Insert mode movement
	{ { "i", "c" }, "<A-h>", "<left>", "left" },
	{ { "i", "c" }, "<A-l>", "<right>", "right" },
	{ { "i", "c" }, "<A-k>", "<up>", "up" },
	{ { "i", "c" }, "<A-j>", "<down>", "down" },
	{ { "i", "c" }, "<C-e>", "<end>", "end" },
	{ { "i", "c" }, "<C-a>", "<home>", "home" },

	-- Escape
	{ { "i", "v", "s", "n" }, ";j", "<ESC>", "ESCAPE" },
	{ "t", ";j", "<C-\\><C-n>", "ESCAPE" },
	{ "c", ";j", "<C-c>", "ESCAPE" },

	-- Yank/Delete
	{ { "n", "v" }, "<leader>yp", '"*p', "Paste *" },
	{ "v", "<leader>yy", '"*y', "Yank *", noremap = true },
}

-- Apply all keymaps
for _, keymap in ipairs(keymaps) do
	local mode, lhs, rhs = keymap[1], keymap[2], keymap[3]
	local opts = {}

	-- 收集键值对形式的选项
	for k, v in pairs(keymap) do
		if type(k) == "string" then
			opts[k] = v
		elseif type(k) ~= "string" and k == 4 then
			opts.desc = v
		end
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end
