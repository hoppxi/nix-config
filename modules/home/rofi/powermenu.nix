{ pkgs, ... }:

{
  home.file."bin/rofi-power-menu".text = ''
    #!/usr/bin/env bash

    entries=" Lock\n⏾ Suspend\n Reboot\n Power Off"
    selected=$(echo -e "$entries" | rofi -dmenu -p "Power")

    case "$selected" in
      *Lock) loginctl lock-session ;;
      *Suspend) systemctl suspend ;;
      *Reboot) systemctl reboot ;;
      *Power*) systemctl poweroff ;;
    esac
  '';
  home.file."bin/rofi-power-menu".executable = true;
}
