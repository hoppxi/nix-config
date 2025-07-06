{ config, pkgs, ... }:

{
  "hyprland/workspaces" = {
    format = "{icon}";
    on-click = "hyprctl dispatch workspace e+1";
    on-scroll-up = "hyprctl dispatch workspace -1";
    on-scroll-down = "hyprctl dispatch workspace +1";
    persistent-workspaces = {
      "1" = [];
      "2" = [];
      "3" = [];
      "4" = [];
      "5" = [];
    };
  };
}