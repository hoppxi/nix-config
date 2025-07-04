{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";  # Enables Wayland support for Chromium-based apps
    WLR_NO_HARDWARE_CURSORS = "1"; # fixes cursor glitches
  };
}
