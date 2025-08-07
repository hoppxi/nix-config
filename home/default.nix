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
    ./modules/lite-xl
  ];

  home = {
    username = "hoppxi";
    homeDirectory = "/home/hoppxi";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
