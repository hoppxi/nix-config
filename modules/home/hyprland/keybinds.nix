{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, Q, exec, kitty"
      "SUPER, E, exec, thunar"
      "SUPER, V, togglefloating,"
      "SUPER, RETURN, exec, kitty"
      "SUPER, D, exec, rofi -show drun"
      "SUPER SHIFT, Q, killactive,"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
