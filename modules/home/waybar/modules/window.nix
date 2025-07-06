{ config, pkgs, ... }:

{
  "hyprland/window" = {
    swap-icon-label = false;
    format = " {}";
    tooltip = false;
    icon = true;
    icon-size = 18;
    max-length = 30;

    rewrite = {
      "" = "<span foreground='#89b4fa'> </span> Hyprland";
      "~" = "  Terminal";
      "tmux(.*)" = "<span foreground='#a6e3a1'> </span> Tmux";
    };
  };
}