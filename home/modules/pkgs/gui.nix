{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Browsers
    brave

    # alacritty
    # neovim
    # vscode
    # lite-xl

    # Productivity
    onlyoffice-bin
    gnome-clocks

    # Messaging
    telegram-desktop
    vesktop

    imv
    spotify
    pavucontrol

    fuzzel
  ];
}
