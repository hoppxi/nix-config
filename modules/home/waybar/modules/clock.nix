{ config, pkgs, ... }:

{
  clock = {
    format = "{:%I:%M %p}";
    tooltip-format = "{:%A, %d %B %Y}";
    on-click = "~/.config/rofi/scripts/calendar.sh";
  };
}
