{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dunst"
      "hyprpaper"
      "hypridle"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "udiskie"
    ];
  };
}
