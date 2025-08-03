
local ok, neotree = pcall(require, "neo-tree")
if not ok then
  vim.notify("neo-tree not found")
  return
end

neotree.setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    filtered_items = {
      visible = true,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
    follow_current_file = {
      enabled = true
    },
    use_libuv_file_watcher = true,
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = "toggle_node",
      ["<cr>"] = "open",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      ["a"] = "add",
      ["d"] = "delete",
    }
  },
})

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
