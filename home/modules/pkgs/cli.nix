{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Networking / Download
    curl
    wget
    unzip

    # System Utilities
    htop
    btop
    ncdu
    lm_sensors
    powertop
    brightnessctl
    man-pages

    # CLI Tools
    eza
    fd
    ripgrep
    fzf
    jq
    bat
    tree
    tldr
    du-dust
    zip

    # Theming
    zsh-powerlevel10k

    # Media Tools
    ffmpeg
    mediainfo
    ueberzugpp

    # Audio Control
    mopidy
    mpc
    pamixer
    playerctl

    # Clipboard & Notifications
    wl-clipboard
    cliphist
    libnotify

    # USB Utils
    usbutils # Includes lsusb
    pciutils # Includes lspci

    # Bluetooth
    bluez-experimental

    # Screenshot
    grim
    slurp
    wf-recorder

    socat
    udiskie
  ];
}
