{ config, pkgs, ... }: 

{
  "custom/exit" = {
    format = " ";
    tooltip-format = "Powermenu";
    on-click = "rofi -drun show";
    tooltip = false;
  };
}