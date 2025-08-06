{ config, ... }:

{
  imports = [
    ./modules/git
    ./modules/hypr
    ./modules/media
    ./modules/nvim
    ./modules/pkgs
    ./modules/services
    ./modules/shell
    ./modules/terminal
    ./modules/theming
  ];

  home = {
    username = "hoppxi";
    homeDirectory = "/home/hoppxi";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
