-- This file does not use any plugin manager; plugins are handled via Nix

-- Plugins are declared in Nix via `modules/home/nvim/packages.nix`
-- These declarations load config only

require('alpha').setup(require('alpha.themes.dashboard').opts)

vim.cmd([[colorscheme tokyonight]])

vim.cmd [[
  highlight AlphaHeader guifg=#7aa2f7   " blue for header
  highlight AlphaButtons guifg=#9ece6a  " green for buttons
  highlight AlphaFooter guifg=#c0caf5   " lighter blue for footer
]]