{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core CLI tools
    jq
    just
    git
    git-filter-repo

    # CLI tools
    curl
    wget
    neofetch
    htop
    unzip
    zip
    ffmpeg
    bat
    btop
    lazygit
    du-dust
    eza
    zoxide
    fd
    ripgrep
    jq
    fzf
    tmux
    cmatrix
    pamixer

    upower
    libnotify

    lm_sensors
    playerctl
    pavucontrol
    mediainfo

    zsh-powerlevel10k

    # qt and gtk app theme
    gnome-themes-extra
    papirus-icon-theme
    bibata-cursors
    adwaita-qt
    catppuccin-gtk

    ncmpcpp
    brightnessctl
    powertop
  ];
}