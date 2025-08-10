{
  pkgs,
  ...
}:

{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Hyprland-Logo";
    package = pkgs.hyprcursor;
    size = 32;
    hyprcursor.enable = true;
    hyprcursor.size = 32;
  };

  wayland.windowManager.hyprland.settings = {
    cursor = {
      zoom_factor = 1;
      zoom_rigid = false;
    };
  };

}
