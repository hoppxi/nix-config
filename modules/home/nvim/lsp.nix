{ pkgs, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    rust-analyzer
    nodePackages.typescript-language-server
    pyright
  ];

  programs.neovim.extraConfig = ''
    lua << EOF
      require('lspconfig').pyright.setup{}
      require('lspconfig').tsserver.setup{}
      require('lspconfig').rust_analyzer.setup{}
      require('lspconfig').lua_ls.setup{}
    EOF
  '';
}
