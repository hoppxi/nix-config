{ config, lib, ... }:

let
  inherit (lib) genList imap0;

  toggleWidget = import ../waybar/modules/toggle-widget.nix;

  mod = "SUPER";
  shift = "SHIFT";
  ctrl = "CTRL";
  alt = "ALT";
  ctrlAlt = "CTRLALT";
  ctrlShift = "CTRLSHIFT";

  # Workspace switching
  workspaceBinds = genList (
    n: "${mod}, ${toString (if n == 10 then 0 else n)}, workspace, ${toString n}"
  ) 10;

  moveToWorkspaceBinds = genList (
    n: "${mod} ${shift}, ${toString (if n == 10 then 0 else n)}, movetoworkspace, ${toString n}"
  ) 10;

  # Rofi script menu
  rofiMenuBinds = [
    "battery"
    "power"
    "volume"
    "backlight"
    "wifi"
    "calendar"
    "screenshot"
    "music"
    "clipboard"
  ];
  rofiMenuMapped = imap0 (
    i: name: "${ctrlAlt}, ${toString (i + 1)}, exec, ~/.config/rofi/scripts/${name}.sh"
  ) rofiMenuBinds;

  # EWW Widgets
  ewwMenuBinds = [
    "power"
    "quicksettings"
    "music"
    "calendar"
    "screenshot"
  ];
  ewwMenuMapped = imap0 (
    i: name: "${ctrlShift}, ${toString (i + 1)}, exec, ${toggleWidget.tw name}"
  ) ewwMenuBinds;

  # Wallpaper switch
  # Out of key
  wallpaperBinds = [
    "${ctrlAlt}, Q, exec, hyprctl hyprpaper wallpaper 'eDP-1,~/.local/share/hyprpaper/wallpapers/wallpaper1.jpg'"
    "${ctrlAlt}, W, exec, hyprctl hyprpaper wallpaper 'eDP-1,~/.local/share/hyprpaper/wallpapers/wallpaper2.jpg'"
    "${ctrlAlt}, R, exec, ~/.config/hypr/scripts/random-wallpaper.sh"
  ];

  # Audio + Brightness
  bindlKeys = [
    ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
    ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ",XF86AudioNext, exec, playerctl next"
    ",XF86AudioPause, exec, playerctl play-pause"
    ",XF86AudioPlay, exec, playerctl play-pause"
    ",XF86AudioPrev, exec, playerctl previous"
  ];

  # Mouse binds
  bindmKeys = [
    "${mod}, mouse:272, movewindow"
    "${mod}, mouse:273, resizewindow"
  ];

  # Core binds
  coreBinds = [
    "${mod}, escape, exec, kitty"
    "${mod}, C, exec, kitty"
    "${mod}, E, exec, thunar"
    "${mod}, D, exec, rofi -show drun"
    "${mod}, V, exec, code"
    "${mod}, B, exec, brave &"

    "${mod}, T, togglefloating,"
    "${mod}, Q, killactive,"
    "${mod} ${shift}, Q, exit,"
    "${mod}, P, pseudo,"
    "${mod}, O, togglesplit,"

    "${mod}, left, movefocus, l"
    "${mod}, right, movefocus, r"
    "${mod}, up, movefocus, u"
    "${mod}, down, movefocus, d"

    "${mod}, G, resizeactive, -20 0"
    "${mod}, H, resizeactive, 0 20"
    "${mod}, J, resizeactive, 0 -20"
    "${mod}, K, resizeactive, 20 0"

    "${mod}, M, togglespecialworkspace, magic"
    "${mod} ${shift}, M, movetoworkspace, special:magic"

    "${mod}, mouse_down, workspace, e+1"
    "${mod}, mouse_up, workspace, e-1"
    "${mod}, A, workspace, e+1"
    "${mod}, S, workspace, e-1"

    "${mod}, L, exec, hyprlock"
    "${mod}, F3, exec, hyprlock"

    "${ctrl},escape, exec, eww close-all && echo 0 > /tmp/eww_toggle"
    ",Print , exec ,grim ~/Pictures/Screenshots/screenshot-$(date +%F_%T).png"
    "${ctrl}, Print, exec, grim -g \"$(slurp)\" ~/Pictures/Screenshots/screenshot-$(date +%F_%T).png"
    "${ctrl}, F12, exec, wf-recorder -f ~/Pictures/Screenshots/Records/recording-$(date +%F_%T).mp4 --size 3840x2160 --pos 0,0"
    "${ctrl}, F11, exec, pkill -INT wf-recorder"
    "${alt}, S, exec, ${toggleWidget.tw "screenshot"}"
    "${mod}${shift}, S, exec, ${toggleWidget.tw "screenshot"}"

  ];
in
{
  wayland.windowManager.hyprland.settings = {
    bind =
      coreBinds
      ++ workspaceBinds
      ++ moveToWorkspaceBinds
      ++ rofiMenuMapped
      ++ ewwMenuMapped
      ++ wallpaperBinds;
    bindl = bindlKeys;
    bindm = bindmKeys;
  };
}
