{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [

    protonvpn-gui
    telegram-desktop
    kdePackages.kdeconnect-kde

    brave
    spotify
    vlc
    imv

    flameshot
    gnome-system-monitor
    gparted

    gthumb

    micro
    mupdf
    libreoffice-fresh

    nautilus
    yazi

    qbittorrent
    bleachbit
    webcamoid
  ];
}
