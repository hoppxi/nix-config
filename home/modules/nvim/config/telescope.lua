local telescope = require("telescope")
telescope.setup {
  defaults = {
    layout_strategy = "horizontal",
    sorting_strategy = "descending",
    layout_config = {
      prompt_position = "top",
    },
  },
}
