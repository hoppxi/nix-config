{ pkgs, ... }: 

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-treesitter.withAllGrammars
    telescope-nvim
    nvim-lspconfig
    gruvbox
    plenary-nvim
  ];

  programs.neovim.extraConfig = ''
    colorscheme gruvbox
    lua << EOF
      require('telescope').setup{}
    EOF
  '';
}
