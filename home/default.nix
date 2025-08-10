{ config, ... }:

{
  imports = [
    ./modules/git
    ./modules/hypr
    ./modules/media
    ./modules/editors
    ./modules/pkgs
    ./modules/services
    ./modules/shell
    ./modules/terminal
    ./modules/theming
  ];

  home = {
    username = "hoppxi";
    homeDirectory = "/home/hoppxi";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
