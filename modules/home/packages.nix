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

    upower
    libnotify

    lm_sensors
    playerctl
    mediainfo
  ];
}