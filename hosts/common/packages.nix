{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    zsh
    home-manager

    # Bluetootj & sound
    pipewire
    wireplumber
    pulseaudio
    bluez
    bluez-tools
    blueman
    udiskie
  ];

}
