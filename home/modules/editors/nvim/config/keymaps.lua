vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Alpha dashboard
vim.keymap.set("n", "<leader>;", ":Alpha<CR>", { desc = "Open dashboard", noremap = true, silent = true })

-- Neo-tree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file tree", noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", ":Neotree reveal<CR>", { desc = "Reveal current file in tree", noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", ":Neotree buffers reveal float<CR>", { desc = "Buffers list", noremap = true, silent = true })
vim.keymap.set("n", "<leader>g", ":Neotree git_status toggle<CR>", { desc = "Git status in tree", noremap = true, silent = true })

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "List open buffers", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files", noremap = true, silent = true })

-- Bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer", noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close current buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":BufferLinePickClose<CR>", { desc = "Pick buffer to close", noremap = true, silent = true })


--[[───────────────────────────────────────────────────────────────
<Space>;      → Open Alpha dashboard
<Space>e      → Toggle file tree (Neo-tree)
<Space>o      → Reveal current file in tree
<Space>b      → Show open buffers in float view
<Space>g      → Git status in tree

<Space>ff     → Find files (Telescope)
<Space>fg     → Live grep
<Space>fb     → List open buffers
<Space>fh     → Help tags
<Space>fr     → Recent files

<Tab>         → Next buffer (Bufferline)
<Shift-Tab>   → Previous buffer
<Space>c      → Close current buffer
<Space>bp     → Pick buffer to close
───────────────────────────────────────────────────────────────]]
