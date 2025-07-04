{ config, pkgs, ... }:

{
  imports = [
    ./style.nix
    ./wifi.nix
    ./powermenu.nix
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];

    terminal = "kitty";
    theme = ./theme.rasi;
  };
}
