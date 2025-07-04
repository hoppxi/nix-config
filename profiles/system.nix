{ inputs, pkgs, config, lib, ... }:

{
  imports = [
    ../modules/system/hardware-configuration.nix

    # Core
    ../modules/system/locale.nix
    ../modules/system/fonts.nix
    ../modules/system/networking.nix
    ../modules/system/shells.nix

    # Hyprland system services
    ../modules/system/hyprland/default.nix

    # ../modules/system/bluetooth.nix
    # ../modules/system/printing.nix
    # ../modules/system/virtualisation.nix
  ];
}
