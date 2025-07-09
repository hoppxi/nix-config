{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, C, exec, kitty"
      "SUPER, E, exec, thunar"
      "SUPER, V, togglefloating,"
      "SUPER, RETURN, exec, kitty"
      "SUPER, D, exec, rofi -show drun"
      "SUPER, Q, killactive,"
      "SUPER, M, exit,"
      "SUPER, P, pseudo, # dwindle"
      "SUPER, J, togglesplit, # dwindle"

      # Move focus with mainMod + arrow keys
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"

      # Example special workspace (scratchpad)
      "SUPER, S, togglespecialworkspace, magic"
      "SUPER SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
      "SUPER, mouse_down, workspace, e+1"
      "SUPER, mouse_up, workspace, e-1"

      # menu
      "CTRL SHIFT, 1, exec, ~/.config/rofi/scripts/battery.sh"
      "CTRL SHIFT, 2, exec, ~/.config/rofi/scripts/power.sh"
      "CTRL SHIFT, 3, exec, ~/.config/rofi/scripts/volume.sh"
      "CTRL SHIFT, 4, exec, ~/.config/rofi/scripts/backlight.sh"
      "CTRL SHIFT, 5, exec, ~/.config/rofi/scripts/wifi.sh"
      "CTRL SHIFT, 6, exec, ~/.config/rofi/scripts/calendar.sh"
      "CTRL SHIFT, 7, exec, ~/.config/rofi/scripts/screenshot.sh"
      "CTRL SHIFT, 8, exec, ~/.config/rofi/scripts/music.sh"

      # hyprlock
      "SUPER, L, exec, hyprlock"

      # screenshot and recorder
      "CTRL, F11, exec, pkill wf-recorder"

      # Wallpaper
      "CTRLALT, 1, exec, hyprctl hyprpaper wallpaper 'eDP-1,~/.local/share/hyprpaper/wallpapers/wallpaper1.jpg'"
      "CTRLALT, 2, exec, hyprctl hyprpaper wallpaper 'eDP-1,~/.local/share/hyprpaper/wallpapers/wallpaper2.jpg'"

      "CTRLALT, R, exec, ~/.config/hypr/scripts/random-wallpaper.sh"
      # Wallpaper with according workspace
      # "SUPER, 1, exec, hyprctl hyprpaper wallpaper 'eDP-1,~/.local/share/hyprpaper/wallpapers/wallpaper1.jpg'"

      # Update flake
      # "SUPER SHIFT, F, exec, ~/.config/scripts/updater/flake_updater.sh"
      # "SUPER CTRL, F, exec, ~/.config/scripts/updater/kill.sh "
    ];

    bindl = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"

      # Requires playerctl
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
