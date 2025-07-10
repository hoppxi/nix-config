{ config, pkgs, ... }:

{
  imports = [
    ./style.nix
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];

    terminal = "kitty";
    theme = ./theme.rasi;
  };
  home.file = builtins.listToAttrs (
    map
      (name: {
        name = ".config/rofi/scripts/${name}.sh";
        value = {
          source = ../../../scripts/menu/${name}.sh;
          executable = true;
        };
      })
      [
        "battery"
        "power"
        "volume"
        "wifi"
        "backlight"
        "calendar"
        "screenshot"
        "music"
        "clipboard"
      ]
  );
}
