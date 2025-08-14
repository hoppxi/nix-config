{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  services = {
    dbus.enable = true;
    seatd.enable = true;

    getty.greetingLine = "Welcome to Nixos @ea!";
    getty.helpLine = "Enter username and password to login.\nRun nixos-help for Nixos manual";
  };

  environment.systemPackages = with pkgs; [
    hyprland
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];
}
