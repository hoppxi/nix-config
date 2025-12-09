{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    config.common.default = "wlr";
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      kdePackages.xdg-desktop-portal-kde
    ];
  };

  environment.sessionVariables = {
    XDG_DESKTOP_PORTAL = "xdg-desktop-portal-wlr";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
