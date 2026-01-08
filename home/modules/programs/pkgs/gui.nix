{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    protonvpn-gui
    telegram-desktop
    brave
    spotify
    vlc
    imv
    (pkgs.mpv.override { scripts = [ pkgs.mpvScripts.mpris ]; })
    flameshot
    micro
    mupdf
    libreoffice-fresh
    nautilus
    yazi
  ];
}
