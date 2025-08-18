let
  colors = import ../../theme;
  c-no-ht = {
    primary = builtins.substring 1 6 colors.primary;
    inverse-primary = builtins.substring 1 6 colors.inverse-primary;
    primary-container = builtins.substring 1 6 colors.primary-container;
    outline-variant = builtins.substring 1 6 colors.outline-variant;
    black = builtins.substring 1 6 colors.scrim;
  };
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 2.5;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" =
        "rgba(${c-no-ht.primary}ee) rgba(${c-no-ht.inverse-primary}ee) rgba(${c-no-ht.primary-container}ee) 45deg";
      "col.inactive_border" = "rgba(${c-no-ht.outline-variant}aa)";
    };

    decoration = {
      rounding = 10;
      rounding_power = 2;
      blur = {
        enabled = true;
        xray = true;
        special = false;
        new_optimizations = true;
        size = 14;
        passes = 3;
        brightness = 1;
        noise = 0.01;
        contrast = 1;
        popups = true;
        popups_ignorealpha = 0.6;
        input_methods = true;
        input_methods_ignorealpha = 0.8;
      };

      active_opacity = 0.9;
      inactive_opacity = 0.7;
      dim_inactive = true;
      dim_strength = 0.025;
      dim_special = 0.07;

      shadow = {
        enabled = true;
        ignore_window = true;
        range = 30;
        offset = "0 2";
        render_power = 4;
        color = "rgba(${c-no-ht.black}10)";
      };
    };
  };
}
