{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Browsers
    brave

    # alacritty
    # neovim
    lite-xl

    # Productivity
    onlyoffice-bin
    gnome-clocks

    # Messaging
    telegram-desktop
    vesktop

    # File
    ranger

    imv
    spotify
    pavucontrol

    tofi
  ];
}
