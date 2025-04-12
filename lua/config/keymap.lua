local map = vim.keymap.set

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "。", "。<c-g>u")
map("i", "，", "，<c-g>u")
map("i", "；", "；<c-g>u")

--  Use CTRL+<hjkl> to switch between windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Adjust window sizes
map("n", "<A-->", "<C-w><", { desc = "Decrease window width" })
map("n", "<A-=>", "<C-w>>", { desc = "Increase window width" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr>", { desc = "Save File" })

-- quit
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>wqa<cr>", { desc = "Quit" })

-- move
map({ "i", "c" }, "<C-b>", "<left>", { desc = "left" })
map({ "i", "c" }, "<C-f>", "<right>", { desc = "right" })
map("i", "<C-e>", "<end>", { desc = "end" })
map("i", "<C-a>", "<home>", { desc = "home" })

-- escape
-- map({ "i", "x", "n", "c", "v" }, "jj", "<ESC>", { desc = "ESCAPE" })
