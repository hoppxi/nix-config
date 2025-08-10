{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

    plugins = [
      inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    ];

    # settings.plugin = {
    #   overview = {

    #     dragAlpha = 0.7;

    #     panelBorderWidth = 2;
    #     reservedArea = 0;
    #     workspaceBorderSize = 2;

    #   };
    # };
  };
}
