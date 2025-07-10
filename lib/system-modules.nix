{ inputs, ... }:
{

  imports = [
    ../modules/system/fonts.nix
    ../modules/system/networking.nix
    ../modules/system/locales.nix
    ../modules/system/hardware-configuration.nix
    ../modules/system/shell.nix
    ../modules/system/hyprland
  ];
}
