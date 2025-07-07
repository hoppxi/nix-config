{ config, pkgs, username, ... }:

{
  home.file.".config/hypr/hyprlock.conf".text = ''
    general {
      hide_cursor = true
    }

    background {
      monitor = eDP-1
      path = ~/Pictures/wall9.jpg
      blur_passes = 3
      blur_size = 8
    }

    input-field {
      monitor = eDP-1
      size = 300, 50
      position = 0, -200
      outline_thickness = 2
      inner_color = rgba(00000099)
      outer_color = rgba(ffffff44)
      font_color = rgba(ffffffee)
      fade_on_empty = false
      placeholder_text = 󰌾 Password
    }

    label {
      monitor = eDP-1
      text = cmd[update:1000] echo "$(date '+%I:%M%P')"
      position = 0, 0
      font_size = 56
      color = rgba(ffffffee)
    }

    label {
      monitor = eDP-1
      text = Hi ${username} :)
      position = 0, -100
      font_size = 26
      color = rgba(ffffffcc)
    }
  '';
}
