{
  pkgs,
  config,
  lib,
  ...
}:

{
  imports = [
    ./swaync
    ./status
    ./udiskie
    ./wallpaper
  ];

  home.file = builtins.listToAttrs (
    map
      (name: {
        name = ".config/scripts/services/${name}.sh";
        value = {
          source = ../../../scripts/services/${name}.sh;
          executable = true;
        };
      })
      [
        "battery"
        "network"
        "bluetooth"
      ]
  );
}
