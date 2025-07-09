{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprpaper"
      "waybar"
    ];
  };
}