{ config, lib, pkgs, ... }:

{
  imports = [
    ./style.nix
    ./modules/workspaces.nix
    ./modules/clock.nix
    ./modules/battery.nix
    ./modules/cpu.nix
    ./modules/memory.nix
    ./modules/network.nix
  ];

  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      height = 30;
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "cpu" "memory" "battery" "network" ];
    }];
  };
}
