{ inputs, pkgs, config, lib, ... }:

{
  imports = [
    ../modules/system/hardware-configuration.nix

    # Core
    ../modules/system/locales.nix
    ../modules/system/fonts.nix
    ../modules/system/networking.nix
    ../modules/system/shell.nix
    ../modules/system/sound.nix
    ../modules/system/bootloader.nix
    ../modules/system/packages.nix

    # Hyprland system services
    ../modules/system/hyprland/default.nix

    # sddm
    ../modules/system/sddm.nix

    # ../modules/system/bluetooth.nix
    # ../modules/system/printing.nix
    # ../modules/system/virtualisation.nix
  ];
}
