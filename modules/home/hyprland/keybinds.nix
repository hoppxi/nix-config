{ config, lib, ... }:

let
  inherit (lib) genList;

  mod = "SUPER";
  shift = "SHIFT";
  ctrl = "CTRL";
  alt = "ALT";
  ctrlAlt = "CTRLALT";
  ctrlShift = "CTRL SHIFT";

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
  rofiMenuMapped = lib.imap0 (
    i: name: "${ctrlShift}, ${toString (i + 1)}, exec, ~/.config/rofi/scripts/${name}.sh"
  ) rofiMenuBinds;

  # Wallpaper switch
  wallpaperBinds = [
    "${ctrlAlt}, 1, exec, hyprctl hyprpaper wallpaper 'eDP-1,~/.local/share/hyprpaper/wallpapers/wallpaper1.jpg'"
    "${ctrlAlt}, 2, exec, hyprctl hyprpaper wallpaper 'eDP-1,~/.local/share/hyprpaper/wallpapers/wallpaper2.jpg'"
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
    "${mod}, RETURN, exec, kitty"
    "${mod}, C, exec, kitty"
    "${mod}, E, exec, thunar"
    "${mod}, D, exec, rofi -show drun"
    "${mod}, T, togglefloating,"
    "${mod}, Q, killactive,"
    "${mod}, M, exit,"
    "${mod}, P, pseudo,"
    "${mod}, J, togglesplit,"
    "${mod}, left, movefocus, l"
    "${mod}, right, movefocus, r"
    "${mod}, up, movefocus, u"
    "${mod}, down, movefocus, d"
    "${mod}, S, togglespecialworkspace, magic"
    "${mod} ${shift}, S, movetoworkspace, special:magic"
    "${mod}, mouse_down, workspace, e+1"
    "${mod}, mouse_up, workspace, e-1"
    "${mod}, L, exec, hyprlock"
    "${ctrl}, F11, exec, pkill wf-recorder"
  ];
in
{
  wayland.windowManager.hyprland.settings = {
    bind = coreBinds ++ workspaceBinds ++ moveToWorkspaceBinds ++ rofiMenuMapped ++ wallpaperBinds;
    bindl = bindlKeys;
    bindm = bindmKeys;
  };
}
