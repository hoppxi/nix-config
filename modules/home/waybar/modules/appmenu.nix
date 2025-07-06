{ config, pkgs, ... }:

{
  "custom/appmenu" = {
    format = "Apps";
    on-click = "rofi -show drun -replace";
    tooltip = false;
  };
}