{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  services.displayManager.enable = false;
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;

  services.getty.autologinUser = "hoppxi";

  services.dbus.enable = true;
  services.seatd.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];
}
