{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [

    # Networking & Communication
    protonvpn-gui
    telegram-desktop
    kdePackages.kdeconnect-kde
    zoom-us

    # Editors
    micro

    # Browsers
    brave

    # Media / Audio
    spotify
    vlc
    mpv

    # System Tools
    eww
    flameshot
    gnome-clocks
    gnome-system-monitor
    gparted
    baobab
    file-roller

    # Graphics / Image / Photo
    gthumb
    inkscape
    krita

    # Docs / Reading
    mupdf
    freeoffice
    kdePackages.okular

    # File Managers
    nautilus
    yazi

    # Utilities
    qbittorrent
    bleachbit
    webcamoid
  ];
}
