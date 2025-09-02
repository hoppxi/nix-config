{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    protonvpn-gui
    onlyoffice-bin
    gnome-clocks
    telegram-desktop
    imv
    spotify
    fuzzel
  ];
}
