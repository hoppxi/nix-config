{ pkgs, ... }:

{

  qt = {
    enable = true;
    platformTheme.name = "gtk"; # use gtk (through gtk2)
    style = {
      name = "gtk2";
      package = pkgs.libsForQt5.breeze-qt5; # Breeze style engine for Qt5
    };
  };
}
