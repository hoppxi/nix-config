{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  services = {
    dbus.enable = true;
    seatd.enable = true;

    getty.greetingLine = "Welcome to ea!";
  };

  environment.systemPackages = with pkgs; [
    hyprland
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];
}
