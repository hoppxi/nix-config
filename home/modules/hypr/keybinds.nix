{ lib, ... }:

let
  inherit (lib) genList imap0;

  mod = "SUPER";
  shift = "SHIFT";
  ctrl = "CTRL";
  alt = "ALT";
  ctrlAlt = "CTRLALT";
  ctrlShift = "CTRLSHIFT";

  # 1-10 super + 0-9 (0 is workspace 10)
  workspaceBinds1to10 = genList (
    n: "${mod}, ${toString (if n == 10 then 0 else n)}, workspace, ${toString n}"
  ) 10;

  # 11-20 super + alt + 0-9 (0 is workspace 20)
  workspaceBinds11to20 = genList (
    n: "${mod} ${alt}, ${toString (if n == 10 then 0 else n)}, workspace, ${toString (n + 10)}"
  ) 10;

  # 1-10 super + shift + 0-9 (0 is workspace 10)
  moveToWorkspaceBinds1to10 = genList (
    n: "${mod} ${shift}, ${toString (if n == 10 then 0 else n)}, movetoworkspace, ${toString n}"
  ) 10;

  # 11-20 super + shift + alt + 0-9 (0 is workspace 20)
  moveToWorkspaceBinds11to20 = genList (
    n:
    "${mod} ${shift} ${alt}, ${
      toString (if n == 10 then 0 else n)
    }, movetoworkspace, ${toString (n + 10)}"
  ) 10;

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
    "${mod}, escape, exec, alacritty"
    "${mod}, C, exec, alacritty"
    "${mod}, E, exec, ranger"
    "${mod}, N, exec, nvim"
    "${mod}, B, exec, brave"

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

    ",Print , exec ,grim ~/Pictures/Screenshots/screenshot-$(date +%F_%T).png"
    "${ctrl}, Print, exec, grim -g \"$(slurp)\" ~/Pictures/Screenshots/screenshot-$(date +%F_%T).png"
    "${ctrl}, F12, exec, wf-recorder -f ~/Pictures/Screenshots/Records/recording-$(date +%F_%T).mp4 --size 3840x2160 --pos 0,0"
    "${ctrl}, F11, exec, pkill -INT wf-recorder"
    "${mod} ${ctrl}, E, hyprexpo:expo, toggle"
  ];
in
{
  wayland.windowManager.hyprland.settings = {
    bind =
      coreBinds
      ++ workspaceBinds1to10
      ++ workspaceBinds11to20
      ++ moveToWorkspaceBinds1to10
      ++ moveToWorkspaceBinds11to20;
    bindl = bindlKeys;
    bindm = bindmKeys;
  };
}
