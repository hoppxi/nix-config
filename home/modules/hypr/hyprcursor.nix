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

}
