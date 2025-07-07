{ config, pkgs, ... }:

{
  mpris = {
    player = "playerctld";

    format = "{statusIcon} {title} - {artist}";
    format-paused = " {title} - {artist}";
    format-playing = " {title} - {artist}";
    format-stopped = " Stopped";
    unknown-tag = "N/A";

    tooltip = true;
    tooltip-format = "♫ {title}\nby {artist}\non {album}";
    max-length = 20;

    status-icons = {
      "paused" = "";
      "playing" = "";
      "stopped" = "";
    };

    on-click = "playerctl play-pause";
    on-click-right = "~/.config/rofi/scripts/mpd.sh";
    on-scroll-up = "playerctl volume 0.05+";
    on-scroll-down = "playerctl volume 0.05-";
  };
}
