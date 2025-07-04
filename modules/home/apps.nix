{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browsers & Communication
    brave
    telegram-desktop
    w3m

    # Terminal & Editors
    kitty
    neovim
    vscode

    # File manager
    xfce.thunar

    vesktop
    gimp
    vlc
    qbittorrent

    # Fonts
    nerd-fonts.jetbrains-mono


    # Media & Utilities
    mpv               # Video player
    imv               # Image viewer

    wf-recorder       # Wayland screen recorder
    grim              # Wayland screenshot
    slurp             # with selection

    onlyoffice-bin    # Office suite
  ];

}


