{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprpaper"
      "waybar"
      "hypridle"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];
  };
}
