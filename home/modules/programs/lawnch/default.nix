{ inputs, ... }:

let
  colors = import ../../theme/colors.nix;

  hexToRgba =
    hex: alpha:
    let
      c = if builtins.substring 0 1 hex == "#" then builtins.substring 1 6 hex else hex;

      fromHex =
        s:
        {
          "0" = 0;
          "1" = 1;
          "2" = 2;
          "3" = 3;
          "4" = 4;
          "5" = 5;
          "6" = 6;
          "7" = 7;
          "8" = 8;
          "9" = 9;
          "a" = 10;
          "b" = 11;
          "c" = 12;
          "d" = 13;
          "e" = 14;
          "f" = 15;
          "A" = 10;
          "B" = 11;
          "C" = 12;
          "D" = 13;
          "E" = 14;
          "F" = 15;
        }
        .${s};

      decodePair = s: (fromHex (builtins.substring 0 1 s) * 16) + (fromHex (builtins.substring 1 1 s));

      r = toString (decodePair (builtins.substring 0 2 c));
      g = toString (decodePair (builtins.substring 2 2 c));
      b = toString (decodePair (builtins.substring 4 2 c));
    in
    "rgba(${r}, ${g}, ${b}, ${alpha})";
in

{
  imports = [
    inputs.lawnch.homeModules.default
  ];

  programs.lawnch = {
    enable = true;

    settings = {
      window = {
        width = 350;
        height = 400;
        anchor = "top,center";
        margin_top = 140;
        margin_bottom = 0;
        margin_left = 0;
        margin_right = 0;
        background_color = hexToRgba colors.background "0.80";
        border_color = hexToRgba colors.primary "0.80";
        border_radius = 20;
        border_width = 2;
      };

      input = {
        font_family = "Inter";
        font_size = 10;
        font_weight = "bold";
        text_color = hexToRgba colors.on-background "1";
        placeholder_color = hexToRgba colors.outline "1";
        caret_color = hexToRgba colors.primary "1";
        background_color = "rgba(0, 0, 0, 0)";
        border_radius = 8;
        border_width = 1;
        border_color = "rgba(0, 0, 0, 0)";
        padding_top = 20;
        padding_bottom = 5;
        padding_left = 20;
        padding_right = 20;
        horizontal_align = "fill";
      };

      results = {
        font_family = "Inter";
        font_size = 10;
        padding_top = 5;
        padding_bottom = 8;
        padding_left = 8;
        padding_right = 8;
        item_spacing = 2;
        item_padding = 8;
        default_border_radius = 8;
        selected_border_radius = 15;
        default_border_color = "rgba(0,0,0,0)";
        selected_border_color = "rgba(0, 0, 0, 0)";
        default_border_width = 0;
        selected_border_width = 0;
        default_text_color = hexToRgba colors.primary "1";
        default_background_color = "rgba(0, 0, 0, 0)";
        selected_text_color = hexToRgba colors.on-primary "0.8";
        selected_background_color = hexToRgba colors.primary "0.8";
        enable_comment = true;
        comment_font_size = 8;
        comment_color = hexToRgba colors.secondary "1";
        selected_comment_color = hexToRgba colors.on-secondary "1";
        enable_icon = true;
        icon_size = 22;
      };
    };

    plugins = {
      powermenu = {
        enable = true;
        settings = {
          order = "lockscreen, shutdown, reboot, suspend, hibernate";
        };
      };

      files = {
        enable = true;
        settings = {
          max_results = 50;
          max_depth = 4;
        };
      };

      wallpapers = {
        enable = true;
        settings = {
          dir = "~/Pictures/Wallpapers";
          max_results = 50;
          command = "waul --set \"{}\"";
        };
      };

      clipboard.enable = true;
      url.enable = true;
      calculator.enable = true;
      command.enable = true;
      emoji.enable = true;
      google.enable = true;
      youtube.enable = true;
    };
  };
}
