{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = "yes";

      bezier = [
        "easeOutQuint, 0.23, 1, 0.32, 1"
        "easeInOutCubic, 0.65, 0.05, 0.36, 1"
        "easeInSine, 0.47, 0, 0.745, 0.715"
        "easeOutExpo, 0.19, 1, 0.22, 1"
        "overshoot, 0.68, -0.95, 0.256, 1.75"
        "spring, 0.5, 1.5, 0.5, 1"
        "snappy, 0.4, 0, 0.2, 1"
        "floaty, 0.3, 0.6, 0.4, 1"
      ];

      animation = [
        # GLOBAL movement
        "global, 1, 5, easeInOutCubic"

        # Border transitions
        "border, 1, 5, easeOutExpo"

        "windows, 1, 4.8, overshoot"
        "windowsIn, 1, 4.2, overshoot, popin 70%"
        "windowsOut, 1, 4.2, easeOutExpo, slidefade 70%"

        # Fades — cinematic subtle bounce
        "fadeIn, 1, 2.4, spring"
        "fadeOut, 1, 2.4, spring"
        "fade, 1, 3.2, floaty"

        # Layers (Rofi, Waybar, Notifications, etc)
        # "layers, 1, 3.5, easeOutQuint"
        # "layersIn, 1, 3.0, spring, fade popin 70%"
        # "layersOut, 1, 3.0, easeInSine, fade popout 80%"
        # "fadeLayersIn, 1, 2.3, floaty"
        # "fadeLayersOut, 1, 2.1, floaty"

        # Workspaces — immersive switching
        "workspaces, 1, 2.4, overshoot, slidefade 40%"
        "workspacesIn, 1, 2.2, overshoot, slidefade 40%"
        "workspacesOut, 1, 2.2, easeOutExpo, slidefade 40%"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      disable_hyprland_logo = false;
      force_default_wallpaper = 0;
      font_family = "JetBrains Mono Nerd Font";
      animate_manual_resizes = true;
    };

    gestures = {
      workspace_swipe = true;
    };

    windowrule = [

      # Focus rules
      "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
      "nofocus, class:^(notifications)$"
      "noborder, class:^(notifications)$"

      # "animation popin, class:^(rofi)$"
      # "animation popout, class:^(rofi)$"
      # "nofocus, class:^(rofi)$"
      # "center, class:^(rofi)$"
      # "float, class:^(rofi)$"
      # "size 50% 40%, class:^(rofi)$"

      "animation popin, class:^(notifications)$"
      "animation popout, class:^(notifications)$"
      "nofocus, class:^(notifications)$"
      "float, class:^(notifications)$"

      "suppressevent maximize, class:.*"
    ];

    layerrule = [
      "blur, waybar"
      "blur, notifications"
      "ignorezero, notifications"
      "blur, rofi"
      "ignorezero, rofi"
      "blur, widget"
    ];
  };
}
