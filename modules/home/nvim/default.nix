{ config, pkgs, ... }: 

{
  imports = [
    ./options.nix
    ./plugins.nix
    ./lsp.nix
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [ ripgrep fd ];
  };
}
