{ lib, ... }:

let
  inherit (lib) genList concatLists;

  mod = "SUPER";
  shift = "SHIFT";
  ctrl = "CTRL";
  alt = "ALT";

  # functions
  make-bind =
    modifiers: key: action: target:
    let
      mods = if modifiers == "" then mod else "${mod} ${modifiers}";
    in
    "${mods}, ${key}, ${action}, ${target}";

  workspace-binds =
    modifiers: action: offset:
    genList (
      i:
      let
        key = toString (if i == 9 then 0 else i + 1);
        workspace = toString (i + 1 + offset);
      in
      make-bind modifiers key action workspace
    ) 10;

  bindl-exec = key: cmd: "${key}, exec, ${cmd}";

  terminal = "foot";
  code-editor = "hx";
  browser = "brave";
  file-manager = "yazi";

  apps = [
    {
      key = "C";
      cmd = terminal;
    }
    {
      key = "X";
      cmd = "${terminal} -e ${code-editor}";
    }
    {
      key = "B";
      cmd = browser;
    }
    {
      key = "E";
      cmd = "${terminal} -e ${file-manager}";
    }
    {
      key = "Y";
      cmd = "spotify";
    }
    {
      key = "L";
      cmd = "hyprlock";
    }
    {
      key = "space";
      cmd = "lawnch";
    }
  ];

  app-binds = map (app: make-bind "" app.key "exec" app.cmd) apps;

  workspace-binds-1to10 = workspace-binds "" "workspace" 0;
  workspace-binds-11to20 = workspace-binds alt "workspace" 10;
  move-to-workspace-binds-1to10 = workspace-binds shift "movetoworkspace" 0;
  move-to-workspace-binds-11to20 = workspace-binds "${shift} ${alt}" "movetoworkspace" 10;

  bindl-keys = [
    (bindl-exec ",XF86AudioRaiseVolume" "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
    (bindl-exec ",XF86AudioLowerVolume" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
    (bindl-exec ",XF86AudioMute" "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
    (bindl-exec ",XF86AudioMicMute" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
    (bindl-exec ",XF86MonBrightnessUp" "brightnessctl -e4 -n2 set 5%+")
    (bindl-exec ",XF86MonBrightnessDown" "brightnessctl -e4 -n2 set 5%-")
    (bindl-exec ",XF86AudioNext" "playerctl next")
    (bindl-exec ",XF86AudioPause" "playerctl play-pause")
    (bindl-exec ",XF86AudioPlay" "playerctl play-pause")
    (bindl-exec ",XF86AudioPrev" "playerctl previous")
  ];

  bindm-keys = [
    "${mod}, mouse:272, movewindow"
    "${mod}, mouse:273, resizewindow"
  ];

  move-focus-binds = [
    (make-bind "" "left" "movefocus" "l")
    (make-bind "" "right" "movefocus" "r")
    (make-bind "" "up" "movefocus" "u")
    (make-bind "" "down" "movefocus" "d")
  ];

  resize-binds = [
    (make-bind "" "A" "resizeactive" "-20 0")
    (make-bind "" "S" "resizeactive" "0 20")
    (make-bind "" "W" "resizeactive" "0 -20")
    (make-bind "" "D" "resizeactive" "20 0")
  ];

  core-binds = concatLists [
    app-binds
    [
      (make-bind "" "T" "togglefloating" "")
      (make-bind "" "Q" "killactive" "")
      (make-bind "shift" "Q" "exit" "")
      (make-bind "" "P" "pseudo" "")
      (make-bind "" "O" "togglesplit" "")

      (make-bind "" "M" "togglespecialworkspace" "magic")
      (make-bind "shift" "M" "movetoworkspace" "special:magic")

      (make-bind "" "mouse_down" "workspace" "e+1")
      (make-bind "" "mouse_up" "workspace" "e-1")
      (make-bind "" "minus" "workspace" "e-1")
      (make-bind "" "equal" "workspace" "e+1")

      ",Print , exec ,grim ~/Pictures/Screenshots/screenshot-$(date +%F_%T).png"
      "${ctrl}, Print, exec, grim -g \"$(slurp)\" ~/Pictures/Screenshots/screenshot-$(date +%F_%T).png"
      "${ctrl}, F12, exec, wf-recorder -f ~/Pictures/Screenshots/Records/recording-$(date +%F_%T).mp4 --size 3840x2160 --pos 0,0"
      "${ctrl}, F11, exec, pkill -INT wf-recorder"
    ]
    move-focus-binds
    resize-binds
  ];

in
{
  wayland.windowManager.hyprland.settings = {
    bind =
      core-binds
      ++ workspace-binds-1to10
      ++ workspace-binds-11to20
      ++ move-to-workspace-binds-1to10
      ++ move-to-workspace-binds-11to20;

    bindl = bindl-keys;
    bindm = bindm-keys;
  };
}
