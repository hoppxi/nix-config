{ pkgs, ... }:
let
  themeName = "Gruvbox-Dark-Brown";
in
{

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style = {
      name = "kvantum";
    };
  };
  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=${themeName}
    '';

    "Kvantum/${themeName}".source = "${pkgs.gruvbox-kvantum}/share/Kvantum/${themeName}";
  };

  home.packages = with pkgs; [
    gruvbox-kvantum
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];
}
