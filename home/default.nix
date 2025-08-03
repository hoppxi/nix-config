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
    ./modules/vscode
    ./modules/browser
    ./modules/ags
    ./modules/eww
  ];

  home = {
    username = "hoppxi";
    homeDirectory = "/home/hoppxi";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
