let
  file' = path: source: {
    name = path;
    value.source = source;
  };
  fileExec = path: source: {
    name = path;
    value = {
      source = source;
      executable = true;
    };
  };
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
        path = "~/.local/share/pictures/lockscreen.jpg";
        blur_passes = 2;
        blur_size = 8;
        contrast = 1;
        brightness = 0.5;
        vibrancy = 0.2;
        vibrancy_darkness = 0.2;
      };

      input-field = {
        monitor = "eDP-1";
        size = "300, 50";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.1;
        dots_center = true;
        inner_color = "rgba(73, 73, 73, 0.27)";
        outer_color = "rgba(227, 227, 227, 0.46)";
        font_color = "rgba(240, 240, 240, 0.92)";
        fade_on_empty = false;
        rounding = -1;
        placeholder_text = "Password";
        hide_input = false;
        position = "0, -240";
      };

      label = [
        # date
        {
          monitor = "eDP-1";
          text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 18;
          font_family = "JetBrains Mono Nerd Font";
          position = "0, 170";
        }

        # time
        {
          monitor = "eDP-1";
          text = "$TIME12";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 70;
          font_family = "JetBrains Mono Nerd Font Extrabold";
          position = "0, 100";
        }

        {
          monitor = "eDP-1";
          text = "@hoppxi";
          position = "0, -180";
          font_size = 13;
          color = "rgba(ffffffcc)";
        }

        {
          monitor = "eDP-1";
          text = "cmd[update:1000] ~/.config/hypr/scripts/hyprlock.sh --title";
          position = "630, 20";
          font_family = "JetBrains Mono Nerd Font Bold";
          font_size = 14;
          color = "rgba(ffffffcc)";
          halign = "start";
        }

        {
          monitor = "eDP-1";
          text = "cmd[update:1000] ~/.config/hypr/scripts/hyprlock.sh --artist";
          position = "630, -7";
          font_size = 11;
          color = "rgba(ffffff45)";
          halign = "start";
        }

        {
          monitor = "eDP-1";
          text = "cmd[update:1000] ~/.config/hypr/scripts/hyprlock.sh --album";
          position = "630, -24";
          font_size = 11;
          color = "rgba(ffffff45)";
          halign = "start";
        }
      ];

      shape = [
        {
          monitor = "eDP-1";
          size = "300, 50";
          rounding = -1;
          border_size = 2;
          color = "rgba(73, 73, 73, 0.27)";
          border_color = "rgba(227, 227, 227, 0.46)";
          position = "0, -180";
        }
        {
          monitor = "eDP-1";
          size = "320, 100";
          rounding = 10;
          border_size = 1;
          color = "rgba(73, 73, 73, 0.13)";
          border_color = "rgba(227, 227, 227, 0.21)";
          position = "0, -10";

        }
      ];

      image = {
        monitor = "eDP-1";
        path = "~/.local/share/pictures/avater.jpg";
        size = 90;
        rounding = 10;
        border_size = 1;
        border_color = "$foreground";
        position = "-110, -10";
      };
    };
  };

  home.file = builtins.listToAttrs [
    (fileExec ".config/hypr/scripts/hyprlock.sh" ../../../scripts/hypr/hyprlock.sh)
    (file' ".local/share/pictures/avater.jpg" ../../../assets/images/avater.jpg)
    (file' ".local/share/pictures/lockscreen.jpg" ../../../assets/images/lockscreen.jpg)
  ];

}
