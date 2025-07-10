{ config, pkgs, ... }:

let
  hypridleConf = ''
    general {
      lock_cmd = pidof hyprlock || hyprlock
      before_sleep_cmd = pidof hyprlock || hyprlock
      after_sleep_cmd = hyprctl dispatch dpms on
      inhibit_sleep = 3
    }

    listener {
      timeout = 300
      on-timeout = pidof hyprlock || hyprlock
    }

    listener {
      timeout = 330
      on-timeout = hyprctl dispatch dpms off
      on-resume = hyprctl dispatch dpms on
    }
  '';
in
{
  xdg.configFile."hypr/hypridle.conf".text = hypridleConf;
}
