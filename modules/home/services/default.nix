{ config, pkgs, ... }:

{
  imports = [
    ./battery-watcher.nix
    ./wifi-watcher.nix
  ];

  home.file = builtins.listToAttrs (
    map
      (name: {
        name = ".config/scripts/services/${name}.sh";
        value = {
          source = ../../../scripts/autostart/${name}.sh;
          executable = true;
        };
      })
      [
        "battery-watcher"
        "wifi-watcher"
      ]
  );
}
