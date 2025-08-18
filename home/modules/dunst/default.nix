{ config, pkgs, ... }:

let
  colors = import ../../theme;
in
{
  services.dunst = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
      size = "16x16";
    };

    settings = {
      global = {
        font = "Inter 10";
        background = colors.background;
        foreground = colors.on-background;
        frame_color = colors.primary;
        frame_width = 1;
        gap_size = 5;
        separator_color = "frame";
        corner_radius = 15;
        padding = 10;
        horizontal_padding = 10;
        separator_height = 1;
        transparency = 90;
        idle_threshold = 120;
        icon_position = "left";

        width = 280;
        height = 140;
        notification_limit = 5;
        origin = "top-right";
        offset = "(5, 5)";
      };

      urgency_low = {
        background = colors.surface-container-low;
        foreground = colors.on-surface;
        frame_color = colors.surface-variant;
        timeout = 5;
      };

      urgency_normal = {
        background = colors.surface-container;
        foreground = colors.on-surface;
        frame_color = colors.primary;
        timeout = 8;
      };

      urgency_critical = {
        background = colors.error-container;
        foreground = colors.on-error-container;
        frame_color = colors.error;
        timeout = 0;
      };
    };
  };
}
