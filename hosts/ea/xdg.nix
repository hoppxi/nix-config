{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  environment = {
    sessionVariables = {
      XDG_DESKTOP_PORTAL = "xdg-desktop-portal-gtk";
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

}
