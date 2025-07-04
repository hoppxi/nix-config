{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      bezier = [
        "easein, 0.36, 0, 0.66, -0.56"
      ];
      animation = [
        "windows, 1, 5, easein"
        "fade, 1, 3, default"
        "border, 1, 5, default"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = 0;
    };
  };
}
