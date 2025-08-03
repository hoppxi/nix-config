{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    shellIntegration.enableZshIntegration = true;

    settings = {
      background = "#24283b";
      foreground = "#c0caf5";
      cursor = "#c0caf5";
      selection_background = "#364a82";
      selection_foreground = "#c0caf5";

      color0 = "#1d202f";
      color1 = "#f7768e";
      color2 = "#9ece6a";
      color3 = "#e0af68";
      color4 = "#7aa2f7";
      color5 = "#bb9af7";
      color6 = "#7dcfff";
      color7 = "#a9b1d6";
      color8 = "#414868";
      color9 = "#f7768e";
      color10 = "#9ece6a";
      color11 = "#e0af68";
      color12 = "#7aa2f7";
      color13 = "#bb9af7";
      color14 = "#7dcfff";
      color15 = "#c0caf5";

      enable_audio_bell = false;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      window_border_width = 1;
      draw_minimal_borders = true;
    };
  };
}
