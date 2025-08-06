{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash

    # Bluetootj & sound
    pipewire
    wireplumber
    bluez
    bluez-tools
    blueman
  ];

}
