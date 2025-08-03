{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    hyprlock
    hypridle
  ];
}
