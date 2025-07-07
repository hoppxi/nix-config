{ config, lib, pkgs, username, ... }:

{
  imports = [ 
    ./appearance.nix 
    ./keybinds.nix 
    ./windows.nix 
    ./env.nix 
    ./monitors.nix 
    ./input.nix 
    ./autostart.nix 
    ./hypreco.nix 
    ./hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
