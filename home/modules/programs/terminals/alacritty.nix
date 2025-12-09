let
  colors = import ../../theme/colors.nix;
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "JetBrainsMono Nerd Font";
        size = 10;
      };

      window = {
        padding = {
          x = 8;
          y = 8;
        };
        dynamic_padding = true;
      };

      colors = {
        primary = {
          background = colors.background;
          foreground = colors.on-background;
        };
        cursor = {
          text = colors.background;
          cursor = colors.on-background;
        };
        selection = {
          text = colors.on-background;
          background = colors.surface-container-high;
        };
        normal = {
          black = colors.surface-container-lowest;
          red = colors.error;
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = colors.primary;
          magenta = colors.tertiary;
          cyan = "#7dcfff";
          white = colors.on-surface-variant;
        };
        bright = {
          black = colors.surface-container;
          red = colors.error;
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = colors.primary;
          magenta = colors.tertiary;
          cyan = "#7dcfff";
          white = colors.on-background;
        };
      };
    };
  };
}
