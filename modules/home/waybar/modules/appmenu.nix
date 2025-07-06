{ config, pkgs, ... }:

{
  "custom/appmenu" = {
    format = "󱄅";
    tooltip = true;
    tooltip-format = "Application Menu";
    on-click = "rofi -show drun -replace";
    on-click-right = "rofi -show run -replace";
    on-scroll-up = "rofi -show drun";
    on-scroll-down = "rofi -show window";
    return-type = "json";
    interval = 0;
    exec = "echo '{\"text\": \"󱄅\", \"alt\": \"Apps\"}'";
    exec-if = "command -v rofi";
  };
}
