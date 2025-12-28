let
  colors = import ../../theme/colors.nix;
  color = {
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
      border_size = 1;
      "col.active_border" =
        "rgba(${color.primary}ee) rgba(${color.inverse-primary}ee) rgba(${color.primary-container}ee) 45deg";
      "col.inactive_border" = "rgba(${color.outline-variant}aa)";
    };

    decoration = {
      rounding = 15;
      rounding_power = 2;
      blur = {
        enabled = true;
        xray = true;
        special = false;
        new_optimizations = true;
        size = 4;
        passes = 1;
        brightness = 0.9;
        noise = 0.05;
        contrast = 1.1;
        vibrancy = 0.5;
      };

      active_opacity = 0.95;
      inactive_opacity = 0.8;
      dim_inactive = true;
      dim_strength = 0.025;
      dim_special = 0.07;

      shadow = {
        enabled = true;
        ignore_window = true;
        range = 30;
        offset = "0 2";
        render_power = 4;
        color = "rgba(${color.black}10)";
      };
    };
  };
}
