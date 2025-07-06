{ config, pkgs, ... }:

{
  mpd = {
    format = "{stateIcon} {title} - {artist}";
    format-disconnected = "Disconnected";
    format-stopped = "Stopped";
    format-paused = " {title} - {artist}";
    format-playing = " {title} - {artist}";
    unknown-tag = "N/A";

    interval = 2;

    # Scroll the title if it's too long
    max-length = 50;
    ellipsize = false;
    scroll = true;
    scroll-speed = 0.75;

    state-icons = {
      "paused" = "";
      "playing" = "";
      "stopped" = "";
    };

    tooltip = true;
    tooltip-format = "♫ {title}\nby {artist}\non {album}";

    host = "127.0.0.1";
    port = 6600;

    on-click = "mpc toggle";
    on-click-right = "mpc next";
    on-click-middle = "mpc prev";
    on-scroll-up = "mpc volume +5";
    on-scroll-down = "mpc volume -5";
  };
}
