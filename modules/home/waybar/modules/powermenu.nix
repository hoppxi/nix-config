{ config, pkgs, ... }: 

{
  "custom/powermenu" = {
    format = " ";
    tooltip-format = "Powermenu";
    on-click = "rofi -drun show";
    tooltip = false;
  };
}