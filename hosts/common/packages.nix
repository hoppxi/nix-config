{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    zsh
    home-manager

    # Bluetootj & sound
    pipewire
    wireplumber
    bluez
    bluez-tools
    blueman
  ];

}
