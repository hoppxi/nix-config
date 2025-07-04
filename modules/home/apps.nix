{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browsers & Communication
    brave
    w3m
    telegram-desktop

    # Terminal & Editors
    kitty
    neovim
    vscode

    # File manager
    xfce.thunar
    vesktop
    qbittorrent

    # Media & Utilities
    mpv
    imv
    gimp
    vlc

    wf-recorder       # Wayland screen recorder
    grim              # Wayland screenshot
    slurp             # with selection

    onlyoffice-bin    # Office suite
  ];

}


