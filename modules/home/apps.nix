{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browsers & Communication
    brave
    w3m
    telegram-desktop

    # Terminal & Editors
    kitty
    # neovim # managed at /nvim
    vscode

    # File manager
    xfce.thunar
    ranger
    vesktop
    qbittorrent

    # Media & Utilities
    mpv
    imv
    gimp
    vlc
    spotify

    wf-recorder # Wayland screen recorder
    grim # Wayland screenshot
    slurp # with selection

    onlyoffice-bin # Office suite
  ];

}
