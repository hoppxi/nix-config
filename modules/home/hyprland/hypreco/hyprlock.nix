{ config, pkgs, username, ... }:

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
        path = "~/.local/share/hyprpaper/wallpapers/wallpaper1.jpg";
        blur_passes = 1;
        blur_size = 3;
      };

      input-field = {
        monitor = "eDP-1";
        size = "300,50";
        position = "0, -200";
        outline_thickness = 2;
        inner_color = "rgba(00000099)";
        outer_color = "rgba(ffffff44)";
        font_color = "rgba(ffffffee)";
        fade_on_empty = false;
        placeholder_text = "󰌾 Password";
      };

      label = [
        {
          monitor = "eDP-1";
          text = "$TIME";
          position = "0, 220";
          font_size = 42;
          color = "rgba(ffffffee)";
        }

        {
          monitor = "eDP-1";
          text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
          position = "0, 160";
          font_size = 18;
          color = "rgba(ffffffee)";
        }

        {
          monitor = "eDP-1";
          text = "Welcome ${username}!";
          position = "0, -140";
          font_size = 18;
          color = "rgba(ffffffcc)";
        }
      ];

      image = {
        monitor = "eDP-1";
        path = "~/.local/share/hyprpaper/wallpapers/avater.jpg";
        size = "150, 150";
        position = "0, -20";
        border_size = 2;
        border_color = "rgba(87CEEBcc)";
        rounding = -1;
      };

    };
  };

}
