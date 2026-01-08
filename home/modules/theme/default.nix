{ pkgs, ... }:

{
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "rose-pine-hyprcursor";
    package = pkgs.rose-pine-hyprcursor;
    hyprcursor.enable = true;
    hyprcursor.size = 24;
  };

}
