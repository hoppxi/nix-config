{ lib, ... }:

let
  file' = path: source: {
    name = path;
    value.source = source;
  };
  colors = import ../../theme/colors.nix;
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
      };

      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };

      background = {
        monitor = "eDP-1";
        path = "/media/hdd/Backup/fromC/ermiy/OneDrive/Pictures/wallpaper/foggy-road-car-light-desktop-wallpaper.jpg";
        blur_passes = 1;
        blur_size = 4;
        contrast = 1.1;
        brightness = 0.9;
        vibrancy = 0.5;
        vibrancy_darkness = 0.03;
      };

      input-field = {
        monitor = "eDP-1";
        size = "280, 42";
        outline_thickness = 2;
        dots_size = 0.3;
        dots_spacing = 0.1;
        dots_center = true;
        inner_color = "rgba(${builtins.substring 1 6 colors.outline-variant}55)";
        outer_color = "rgba(${builtins.substring 1 6 colors.outline}77)";
        font_color = "rgba(${builtins.substring 1 6 colors.on-surface-variant}ff)";
        fade_on_empty = false;
        rounding = 8;
        placeholder_text = "<i>|</i>";
        hide_input = false;
        position = "0, -165";
      };

      label = [

        {
          monitor = "eDP-1";
          text = "<b>Enter Password</b>";
          color = "rgba(${builtins.substring 1 6 colors.on-background}ff)";
          font_size = 16;
          font_family = "Inter";
          position = "0, -102";
        }

        {
          monitor = "eDP-1";
          text = "Password is required to unlock";
          color = "rgba(${builtins.substring 1 6 colors.on-surface-variant}ff)";
          font_size = 10;
          font_family = "Inter";
          position = "0, -125";
        }

      ];

      image = [
        # Distro
        {
          monitor = "eDP-1";
          path = "~/.local/share/pictures/nixos.png";
          border_size = 0;
          border_color = "";
          size = 60;
          position = "0, -310";
        }

        {
          monitor = "eDP-1";
          path = "~/.local/share/pictures/lock.png";
          size = 18;
          rounding = 0;
          border_size = 0;
          border_color = "";
          position = "0, 290";
        }
      ];
    };
  };

  home.file = builtins.listToAttrs [
    (file' ".local/share/pictures/lockscreen.jpg" ../../../../assets/images/lockscreen.jpg)
    (file' ".local/share/pictures/lock.png" ../../../../assets/images/icons/lock.png)
    (file' ".local/share/pictures/nixos.png" ../../../../assets/images/icons/nixos.png)
  ];

}
