{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgba(89b4faee) rgba(cba6f7ee) 45deg";
      "col.inactive_border" = "rgba(1e1e2eaa)";
    };

    decoration = {
      rounding = 10;
      rounding_power = 12;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
      active_opacity = 0.85;
      inactive_opacity = 0.76;
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };
    };
  };
}
