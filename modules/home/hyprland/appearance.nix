{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
    };

    decoration = {
      rounding = 10;
      rounding_power = 2;
      blur = {
        enabled = true;
        size = 8;
        passes = 3;
        vibrancy = 0.1696;
      };
      active_opacity = 0.7;
      inactive_opacity = 0.5;
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };
    };
  };
}
