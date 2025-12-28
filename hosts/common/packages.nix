{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    git
    home-manager
    pipewire
    wireplumber
    networkmanager
    pulseaudio
    bluez
    bluez-tools
    blueman
  ];
}
