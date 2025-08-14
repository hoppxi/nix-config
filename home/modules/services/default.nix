{ config, lib, ... }:

{
  imports = [
    ./status.nix
    ./udiskie.nix
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
