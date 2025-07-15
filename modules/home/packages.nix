{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Core CLI Utilities
    git
    git-filter-repo
    just
    jq
    curl
    wget
    unzip
    zip
    ffmpeg

    # System Info & Monitoring
    neofetch
    htop
    btop
    lm_sensors
    powertop
    upower

    # Filesystem Tools
    eza
    du-dust
    fd
    ripgrep
    fzf
    bat

    # Shell & Terminal
    zoxide
    tmux
    zsh-powerlevel10k

    # Fun / Visual CLI
    cmatrix
    pipes
    tty-clock
    hollywood

    # Media & Audio Control
    pamixer
    pavucontrol
    playerctl
    mediainfo
    ncmpcpp
    brightnessctl

    # Clipboard
    wl-clipboard
    cliphist

    # Notifications & Bluetooth
    libnotify
    bluez-experimental

    # Audio Server
    pulseaudio
  ];
}
