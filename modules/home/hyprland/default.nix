{
  config,
  lib,
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./appearance.nix
    ./keybinds.nix
    ./windows.nix
    ./env.nix
    ./monitors.nix
    ./input.nix
    ./autostart.nix
    ./hypreco/packages.nix
    ./hypreco/hyprlock.nix
    ./hypreco/hyprpaper.nix
    ./hypreco/hypridle.nix
    ./hypreco/hyprcursor.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
