{ pkgs, ... }:

{
  home.packages = with pkgs; [
    curl
    wget

    btop
    lm_sensors
    brightnessctl

    eza
    fzf
    jq
    bat
    zip
    unzip

    zsh-powerlevel10k

    ffmpeg
    mediainfo
    ueberzugpp

    pamixer
    playerctl

    wl-clipboard
    cliphist
    libnotify

    bluez-experimental

    grim
    slurp
    wf-recorder

    udiskie
  ];
}
