{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Networking / Download Tools
    curlFull
    wget
    aria2
    nmap
    traceroute
    iperf3
    cloudflare-warp
    openssh

    # System Monitoring / Hardware
    btop
    lm_sensors
    brightnessctl
    usbutils
    pciutils
    smartmontools
    acpi
    powertop

    # Files / Navigation / Search
    eza
    fzf
    ripgrep
    fd
    jq
    bat
    zip
    unzip
    tree
    findutils
    trash-cli
    ncdu

    # Shell / Terminal Environment
    zsh-powerlevel10k
    direnv

    # Media / Image Tools
    ffmpeg
    mediainfo
    ueberzugpp
    imagemagick
    exiftool

    # Audio Control
    pamixer
    playerctl
    pulseaudio
    alsa-utils

    # Clipboard / Notifications / Misc
    wl-clipboard
    cliphist
    libnotify
    socat
    lsof

    # Bluetooth
    bluez-experimental
    bluez-tools

    # Screenshots / Screen Capture (Wayland)
    grim
    slurp
    wf-recorder
    swappy

    # System Config / GNOME Runtime Dependencies
    dconf
    gsettings-desktop-schemas
    gvfs
  ];
}
