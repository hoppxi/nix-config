{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      col.active_border = "rgba(89b4faee) rgba(cba6f7ee) 45deg";
      col.inactive_border = "rgba(1e1e2eaa)";
    };

    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        size = 8;
        passes = 3;
        vibrancy = 0.1696;
      };
      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      col.shadow = "rgba(00000055)";
    };
  };
}
