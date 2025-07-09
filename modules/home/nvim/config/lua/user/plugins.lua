vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  -- UI and Icons
  use "nvim-tree/nvim-web-devicons"
  use "folke/tokyonight.nvim"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/bufferline.nvim"
  use "goolord/alpha-nvim"
  use "lukas-reineke/indent-blankline.nvim"

  -- File Explorer
  use "nvim-tree/nvim-tree.lua"

  -- Telescope
  use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }

  -- LSP and Autocomplete
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
end)
