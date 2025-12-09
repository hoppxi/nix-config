{ pkgs, ... }:
let
  themeName = "Gruvbox-Dark-Medium";
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

  # Ensure the Kvantum Manager and configuration utilities are installed
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];
}
