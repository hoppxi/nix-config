{ pkgs, ... }:

{

  qt = {
    enable = true;
    platformTheme.name = "gtk"; # use gtk (through gtk2)
    style = {
      name = "gtk2";
    };
  };
}
