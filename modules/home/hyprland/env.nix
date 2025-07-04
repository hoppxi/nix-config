{ config, ... }:

{
  wayland.windowManager.hyprland.settings.env = [
    "XCURSOR_SIZE,24"
    "QT_QPA_PLATFORM,wayland"
    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    "WLR_NO_HARDWARE_CURSORS,1"
    "NIXOS_OZONE_WL,1"
  ];
}
