{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Managed at their own folders

    # Browsers
    # brave
    # w3m

    # Terminal
    # kitty
    # alacritty
    # tmux
    # neovim
    # vscode
    lite-xl

    # Productivity
    obsidian
    onlyoffice-bin
    gnome-calculator
    gnome-clocks
    zotero
    mupdf

    # Messaging
    telegram-desktop
    vesktop
    thunderbird

    # File
    nautilus
    ranger
    filezilla
    qbittorrent

    # Media
    imv
    vlc
    spotify
    pavucontrol

  ];
}
