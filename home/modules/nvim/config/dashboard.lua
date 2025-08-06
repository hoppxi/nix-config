local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "░▄▀▄░█░█░█▀█░█▀█░█▀█░█░█░▀█▀",
  "░█▀▀░█▀█░█░█░█▀▀░█▀▀░▄▀▄░░█░",
  "░░▀░░▀░▀░▀▀▀░▀░░░▀░░░▀░▀░▀▀▀",
  " Welcome to Neovim hoppxi :)",
  "  ━━━━━━━━━━━━━━━━━━━━━━━━  ",
}

dashboard.section.buttons.val = {
  dashboard.button("SPC f f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("SPC f o", "  Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC f r", "  Find word", ":Telescope live_grep<CR>"),
  dashboard.button("n",       "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("c",       "  Config", ":e $MYVIMRC<CR>"),
  dashboard.button("q",       "  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = {
  "  Have a productive session!",
}

dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
