{
  config,
  lib,
  pkgs,
  ...
}:

let
  modules = [
    ./modules/workspaces.nix
    ./modules/clock.nix
    ./modules/battery.nix
    ./modules/cpu.nix
    ./modules/memory.nix
    ./modules/network.nix
    ./modules/window.nix
    ./modules/appmenu.nix
    ./modules/quicklinks.nix
    ./modules/mpris.nix
    ./modules/pulseaudio.nix
    ./modules/powermenu.nix
    ./modules/tray.nix
    ./modules/window.nix
    ./modules/backlight.nix
  ];

  widgets = lib.foldl' (
    acc: modulePath:
    lib.recursiveUpdate acc (
      import modulePath {
        config = config;
        pkgs = pkgs;
        lib = lib;
      }
    )
  ) { } modules;
in
{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        mode = "dock";
        height = 36;
        reload_style_on_change = true;
        # gtk-layer-shell = true;
        modules-left = [
          "custom/appmenu"
          "hyprland/window"
          # "group/quicklinks"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "mpris"
          "pulseaudio"
          "network"
          "backlight"
          "battery"
          # "cpu"
          # "memory"
          "tray"
          "clock"
          "custom/powermenu"
        ];

        "battery" = widgets.battery;
        "clock" = widgets.clock;
        "cpu" = widgets.cpu;
        "memory" = widgets.memory;
        "hyprland/window" = widgets."hyprland/window";
        "hyprland/workspaces" = widgets."hyprland/workspaces";
        "mpris" = widgets.mpris;
        "pulseaudio" = widgets.pulseaudio;
        "network" = widgets.network;
        "tray" = widgets.tray;
        "custom/powermenu" = widgets."custom/powermenu";
        "custom/appmenu" = widgets."custom/appmenu";
        "group/quicklinks" = widgets."group/quicklinks";
        "custom/browser" = widgets."custom/browser";
        "custom/github" = widgets."custom/github";
        "custom/youtube" = widgets."custom/youtube";
        "custom/editor" = widgets."custom/editor";
        "backlight" = widgets.backlight;
      }
    ];

    style = builtins.readFile ./style.css;
  };
}
