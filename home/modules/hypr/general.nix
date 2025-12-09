{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,preferred,auto,1"
    ];

    input = {
      kb_layout = "us, et";
      kb_options = "grp:alt_shift_toggle";

      follow_mouse = 1;

      sensitivity = 0;

      touchpad = {
        natural_scroll = false;
      };
    };

    exec-once = [
      "ashell"
      "hypridle"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];

    env = [
      "XCURSOR_SIZE,24"
      "QT_QPA_PLATFORM,wayland"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "WLR_NO_HARDWARE_CURSORS,1"
      "NIXOS_OZONE_WL,1"
      "EDITOR,code"
      "TERMINAL,alacritty"
      "BROWSER,brave"
      "QT_QPA_PLATFORMTHEME,kvantum"
      "QT_STYLE_OVERRIDE,kvantum"
    ];
  };
}
