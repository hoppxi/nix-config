{ config, pkgs, ... }: 

{
  "custom/powermenu" = {
    format = " ";
    tooltip-format = "Powermenu";
    on-click = "~/.config/rofi/scripts/power.sh";
    tooltip = false;
  };
}