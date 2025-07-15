{
  config,
  pkgs,
  username,
  ...
}:

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
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.1; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        inner_color = "rgba(73, 73, 73, 0.27)";
        outer_color = "rgba(227, 227, 227, 0.46)";
        font_color = "rgba(240, 240, 240, 0.92)";
        fade_on_empty = false;
        rounding = -1;
        placeholder_text = "Input Password...";
        hide_input = false;
        position = "0, -100";
        halign = "center";
        valign = "center";
      };

      label = [
        # date
        {
          monitor = "eDP-1";
          text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 18;
          font_family = "JetBrains Mono Nerd Font";
          position = "0, 60";
          halign = "center";
          valign = "center";
        }

        # time
        {
          monitor = "eDP-1";
          text = "$TIME12";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 70;
          font_family = "JetBrains Mono Nerd Font Extrabold";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }

        # {
        #   monitor = "eDP-1";
        #   text = "Welcome ${username}!";
        #   position = "0, -140";
        #   font_size = 18;
        #   color = "rgba(ffffffcc)";
        # }
      ];

      # image = {
      #   monitor = "eDP-1";
      #   path = "~/.local/share/hyprpaper/wallpapers/avater.jpg";
      #   size = 100;
      #   border_size = 2;
      #   border_color = "$foreground";
      #   position = "0, -100";
      #   halign = "center";
      #   valign = "center";
      # };

    };
  };

}
