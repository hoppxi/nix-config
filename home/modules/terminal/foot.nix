{ pkgs, ... }:

let
  colors = import ../../theme;
in
{
  programs.foot = {
    enable = true;
    package = pkgs.foot;

    settings = {
      main = {
        shell = "${pkgs.zsh}/bin/zsh";
        login-shell = "yes";
        term = "foot";
        font = "JetBrainsMono Nerd Font:size=9";
        pad = "8x8";
        dpi-aware = "yes";
        selection-target = "both";
      };

      cursor = {
        style = "block";
        blink = "no";
        unfocused-style = "unchanged";
      };

      scrollback = {
        lines = "5000";
        multiplier = "3.0";
      };

      mouse = {
        "hide-when-typing" = "no";
        "alternate-scroll-mode" = "yes";
      };

      colors = {
        alpha = "1.0";
        background = builtins.substring 1 6 colors.background; # strip '#'
        foreground = builtins.substring 1 6 colors.on-background;

        # ANSI palette (regular)
        regular0 = builtins.substring 1 6 colors.surface-container-lowest;
        regular1 = builtins.substring 1 6 colors.error;
        regular2 = "81C784";
        regular3 = "FFC107";
        regular4 = builtins.substring 1 6 colors.primary;
        regular5 = builtins.substring 1 6 colors.tertiary;
        regular6 = "4DD0E1";
        regular7 = builtins.substring 1 6 colors.on-surface-variant;

        # Bright colors
        bright0 = builtins.substring 1 6 colors.surface-container;
        bright1 = builtins.substring 1 6 colors.error;
        bright2 = "A5D6A7";
        bright3 = "FDD835";
        bright4 = builtins.substring 1 6 colors.primary;
        bright5 = builtins.substring 1 6 colors.tertiary;
        bright6 = "80DEEA";
        bright7 = builtins.substring 1 6 colors.on-background;

        urls = builtins.substring 1 6 colors.primary;
      };

      key-bindings = {
        show-urls-launch = "Control+Shift+o";
        show-urls-copy = "Control+Shift+y";
        color-theme-toggle = "F5";
        spawn-terminal = "Control+Shift+n";
      };
    };
  };
}
