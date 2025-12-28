{ lib, ... }:

let
  inherit (lib) genList concatLists;

  mod = "SUPER";
  shift = "SHIFT";
  ctrl = "CTRL";
  alt = "ALT";

  # functions
  makeBind =
    modifiers: key: action: target:
    let
      mods = if modifiers == "" then mod else "${mod} ${modifiers}";
    in
    "${mods}, ${key}, ${action}, ${target}";

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

  bindlExec = key: cmd: "${key}, exec, ${cmd}";

  terminal = "alacritty";
  codeEitor = "hx";
  browser = "brave";
  fileManager = "nautilus";

  apps = [
    {
      key = "C";
      cmd = terminal;
    }
    {
      key = "X";
      cmd = "${terminal} -e ${codeEitor}";
    }
    {
      key = "B";
      cmd = browser;
    }
    {
      key = "E";
      cmd = fileManager;
    }
    {
      key = "Z";
      cmd = "${terminal} -e yazi";
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
      key = "L";
      cmd = "pidof hyprlock || hyprlock";
    }
  ];

  appBinds = map (app: makeBind "" app.key "exec" app.cmd) apps;

  workspaceBinds1to10 = workspaceBinds "" "workspace" 0;
  workspaceBinds11to20 = workspaceBinds alt "workspace" 10;
  moveToWorkspaceBinds1to10 = workspaceBinds shift "movetoworkspace" 0;
  moveToWorkspaceBinds11to20 = workspaceBinds "${shift} ${alt}" "movetoworkspace" 10;

  bindlKeys = [
    (bindlExec ",XF86AudioRaiseVolume" "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
    (bindlExec ",XF86AudioLowerVolume" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
    (bindlExec ",XF86AudioMute" "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
    (bindlExec ",XF86AudioMicMute" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
    (bindlExec ",XF86MonBrightnessUp" "brightnessctl -e4 -n2 set 5%+")
    (bindlExec ",XF86MonBrightnessDown" "brightnessctl -e4 -n2 set 5%-")
    (bindlExec ",XF86AudioNext" "playerctl next")
    (bindlExec ",XF86AudioPause" "playerctl play-pause")
    (bindlExec ",XF86AudioPlay" "playerctl play-pause")
    (bindlExec ",XF86AudioPrev" "playerctl previous")
  ];

  bindmKeys = [
    "${mod}, mouse:272, movewindow"
    "${mod}, mouse:273, resizewindow"
  ];

  moveFocusBinds = [
    (makeBind "" "left" "movefocus" "l")
    (makeBind "" "right" "movefocus" "r")
    (makeBind "" "up" "movefocus" "u")
    (makeBind "" "down" "movefocus" "d")
  ];

  resizeBinds = [
    (makeBind "" "A" "resizeactive" "-20 0")
    (makeBind "" "S" "resizeactive" "0 20")
    (makeBind "" "W" "resizeactive" "0 -20")
    (makeBind "" "D" "resizeactive" "20 0")
  ];

  coreBinds = concatLists [
    appBinds
    [
      (makeBind "" "T" "togglefloating" "")
      (makeBind "" "Q" "killactive" "")
      (makeBind "shift" "Q" "exit" "")
      (makeBind "" "P" "pseudo" "")
      (makeBind "" "O" "togglesplit" "")

      (makeBind "" "M" "togglespecialworkspace" "magic")
      (makeBind "shift" "M" "movetoworkspace" "special:magic")

      (makeBind "" "mouse_down" "workspace" "e+1")
      (makeBind "" "mouse_up" "workspace" "e-1")
      (makeBind "" "minus" "workspace" "e-1")
      (makeBind "" "equal" "workspace" "e+1")

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
