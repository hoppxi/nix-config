{ pkgs, ... }:

{
  home.packages = with pkgs; [
    networkmanager_dmenu
  ];

  home.file."bin/rofi-wifi-menu".text = ''
    #!/usr/bin/env bash
    networkmanager_dmenu -p "WiFi" -l 10
  '';
  home.file."bin/rofi-wifi-menu".executable = true;
}
