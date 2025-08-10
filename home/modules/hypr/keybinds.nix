{ lib, ... }:

let
  inherit (lib) genList concatLists;

  mod = "SUPER";
  shift = "SHIFT";
  ctrl = "CTRL";
  alt = "ALT";

  makeBind =
    modifiers: key: action: target:
    let
      mods = if modifiers == "" then mod else "${mod} ${modifiers}";
    in
    "${mods}, ${key}, ${action}, ${target}";

  # Apps
  apps = [
    {
      key = "escape";
      cmd = "alacritty";
    }
    {
      key = "C";
      cmd = "alacritty";
    }
    {
      key = "E";
      cmd = "alacritty -e superfile";
    }
    {
      key = "Y";
      cmd = "spotify";
    }
    {
      key = "V";
      cmd = "code";
    }
    {
      key = "N";
      cmd = "nvim";
    }
    # {
    #   key = "X";
    #   cmd = "lite-xl";
    # }
    {
      key = "B";
      cmd = "brave";
    }
    {
      key = "D";
      cmd = "fuzzel -T foot";
    }
    {
      key = "L";
      cmd = "pidof hyprlock || hyprlock";
    }
    {
      key = "F3";
      cmd = "pidof hyprlock || hyprlock";
    }
  ];

  # Map apps to bindings
  appBinds = map (app: makeBind "" app.key "exec" app.cmd) apps;

  # Workspace bindings generator
  workspaceBinds =
    modifiers: action: offset:
    genList (
      i:
      let
        key = toString (if i == 9 then 0 else i + 1);
        workspace = toString (i + 1 + offset);
      in
      makeBind modifiers key action workspace
    ) 10;

  # Generate workspace
  workspaceBinds1to10 = workspaceBinds "" "workspace" 0;
  workspaceBinds11to20 = workspaceBinds alt "workspace" 10;
  moveToWorkspaceBinds1to10 = workspaceBinds shift "movetoworkspace" 0;
  moveToWorkspaceBinds11to20 = workspaceBinds "${shift} ${alt}" "movetoworkspace" 10;

  # Audio and brightness binds (no mod, just keys with exec)
  audioBrightnessBinds = [
    {
      key = ",XF86AudioRaiseVolume";
      cmd = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
    }
    {
      key = ",XF86AudioLowerVolume";
      cmd = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
    }
    {
      key = ",XF86AudioMute";
      cmd = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    }
    {
      key = ",XF86AudioMicMute";
      cmd = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    }
    {
      key = ",XF86MonBrightnessUp";
      cmd = "brightnessctl -e4 -n2 set 5%+";
    }
    {
      key = ",XF86MonBrightnessDown";
      cmd = "brightnessctl -e4 -n2 set 5%-";
    }
    {
      key = ",XF86AudioNext";
      cmd = "playerctl next";
    }
    {
      key = ",XF86AudioPause";
      cmd = "playerctl play-pause";
    }
    {
      key = ",XF86AudioPlay";
      cmd = "playerctl play-pause";
    }
    {
      key = ",XF86AudioPrev";
      cmd = "playerctl previous";
    }
  ];

  bindlExec = key: cmd: "${key}, exec, ${cmd}";
  bindlKeys = map (b: bindlExec b.key b.cmd) audioBrightnessBinds;

  # Mouse binds fixed list
  bindmKeys = [
    "${mod}, mouse:272, movewindow"
    "${mod}, mouse:273, resizewindow"
  ];

  # Core binds
  moveFocusDirs = [
    {
      dir = "left";
      key = "l";
    }
    {
      dir = "right";
      key = "r";
    }
    {
      dir = "up";
      key = "u";
    }
    {
      dir = "down";
      key = "d";
    }
  ];

  resizeKeys = [
    {
      key = "G";
      pos = "-20 0";
    }
    {
      key = "H";
      pos = "0 20";
    }
    {
      key = "J";
      pos = "0 -20";
    }
    {
      key = "K";
      pos = "20 0";
    }
  ];

  moveFocusBinds = map (d: makeBind "" d.dir "movefocus" d.key) moveFocusDirs;
  resizeBinds = map (r: makeBind "" r.key "resizeactive" r.pos) resizeKeys;

  coreBinds = concatLists [
    appBinds
    [
      "${ctrl}, escape, exec, fuzzel -T foot"
      "${mod} ${alt}, E, overview:toggle"

      "${mod}, T, togglefloating,"
      "${mod}, Q, killactive,"
      "${mod} ${shift}, Q, exit,"
      "${mod}, P, pseudo,"
      "${mod}, O, togglesplit,"

      "${mod}, M, togglespecialworkspace, magic"
      "${mod} ${shift}, M, movetoworkspace, special:magic"

      "${mod}, mouse_down, workspace, e+1"
      "${mod}, mouse_up, workspace, e-1"
      "${mod}, A, workspace, e+1"
      "${mod}, S, workspace, e-1"

      ",Print , exec ,grim ~/Pictures/Screenshots/screenshot-$(date +%F_%T).png"
      "${ctrl}, Print, exec, grim -g \"$(slurp)\" ~/Pictures/Screenshots/screenshot-$(date +%F_%T).png"
      "${ctrl}, F12, exec, wf-recorder -f ~/Pictures/Screenshots/Records/recording-$(date +%F_%T).mp4 --size 3840x2160 --pos 0,0"
      "${ctrl}, F11, exec, pkill -INT wf-recorder"
    ]
    moveFocusBinds
    resizeBinds
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
