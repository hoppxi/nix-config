{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprpaper"
      "hypridle"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "eww daemon"
    ];
  };
}
