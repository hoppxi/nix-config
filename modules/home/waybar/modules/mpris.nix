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
    on-click-right = "~/.config/rofi/scripts/music.sh";
  };
}
